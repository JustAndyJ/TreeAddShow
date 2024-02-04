class BinaryTree {
  var number: Int
  var left: BinaryTree?
  var right: BinaryTree?
  init(number: Int) {
    self.number = number
    self.left = nil
    self.right = nil
  }
}
var tree: BinaryTree?

func callMenuTree() {
  var option = 0
  repeat {
    print("\n\nMenu")
    print("1. Insert")
    print("2. Show")
    print("3. remove")
    print("4. search node")
    print("5. create default tree")
    print("6. Exit")
    print("Enter the option: ", terminator: "")
    if let input = readLine(), let intInput = Int(input) {
      option = intInput
    }
  } while option < 1 || option > 6
  switch option {
    case 1: addNodeTree()
    case 2: showTree()
    case 3: print("remove")
    case 4: print("search node")
    case 5: print("create default tree")
    case 6: break
    default: break
  }  
}

func addNodeTree() {
  print("Enter the number: ", terminator: "")
  if let num = readLine(), let number = Int(num) {
    insertNodeTree(number: number)
  }
  callMenuTree()
}

func insertNodeTree(number: Int) {
  
  let newNode = BinaryTree(number: number)
  
  if tree == nil {
    tree = newNode
  } else {
    var current = tree
    var prev: BinaryTree?
    
    while current != nil {
      prev = current
      if number < current!.number {
        current = current?.left
      } else {
        current = current?.right
      }
    } 
    if number < prev!.number {
      prev?.left = newNode
    } else {
      prev?.right = newNode
    }
  }
}

func showTree() {
  var option = 0
  repeat {
    print("\nShow:")
    print("1. Inorden")
    print("2. Preorden")
    print("3. Postorden")
    print("Input the option: ", terminator: "")
    if let opt = readLine(), let intOpt = Int(opt) {
      option = intOpt
    } 
    
  }while option < 1 || option > 3
switch option {
  case 1: showTreeInorden(tree)
  case 2: showTreePreorden(tree)
  case 3: showTreePostorden(tree)
  default: return
  
}
  callMenuTree()
} 
func showTreeInorden(_ aux: BinaryTree?) {
  if let aux = aux {
    showTreeInorden(aux.left)
    print(aux.number, terminator: " ")
    showTreeInorden(aux.right)
  }

}
func showTreePreorden(_ aux: BinaryTree?) {
  if let aux = aux {
    print(aux.number, terminator: " ")
    showTreePreorden(aux.left)
    showTreePreorden(aux.right)
  }

}
func showTreePostorden(_ aux: BinaryTree?) {
  if let aux = aux {
    showTreePostorden(aux.left)
    showTreePostorden(aux.right)
    print(aux.number, terminator: " ")
  }

}
callMenuTree()
