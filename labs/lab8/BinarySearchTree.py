class TreeNode:
    def __init__(self, val: int) -> None:
        self.left = None
        self.right = None
        self.val = val

class BinarySearchTree:
    def __init__(self):
       self.root = None

    def insert(self, val: int) -> None:
        new_node = TreeNode(val)
      
        if self.root is None:
            self.root = new_node
            return
        
        current = self.root
        parent = None

        while current is not None:
            parent = current
            if val < current.val:
                current = current.left
            else:
                current = current.right


        if val < parent.val:
            parent.left = new_node
        else:
            parent.right = new_node

    def search(self, val: int) -> bool:
        current = self.root
        while current is not None:
            if val == current.val:
                return True
            elif val < current.val:
                current = current.left
            else:
                current = current.right
        return False

    def delete(self, val: int) -> None:
        def tree_min(node):
            current = node
            while current.left is not None:
                current = current.left
            return current
        
        def parent(root, node):
            parent = None
            current = root
            while current is not None and current != node:
                parent = current
                if node.val < current.val:
                    current = current.left
                else:
                    current = current.right
            return parent
            
        def successor(node):
            if node.right is not None:
                return tree_min(node.right)
            return None
   
        def delete_node(root, key):
            node_to_delete = root
            parent_of_node = None
            while node_to_delete is not None and node_to_delete.val != key:
                parent_of_node = node_to_delete
                if key < node_to_delete.val:
                    node_to_delete = node_to_delete.left
                else:
                    node_to_delete = node_to_delete.right
            if node_to_delete is None:
                return root
            
            if node_to_delete.left is None and node_to_delete.right is None:
                if parent_of_node is None:
                    return None
                if parent_of_node.left == node_to_delete:
                    parent_of_node.left = None
                else:
                    parent_of_node.right = None
            elif node_to_delete.left is None:
                if parent_of_node is None:
                    return node_to_delete.right
                if parent_of_node.left == node_to_delete:
                    parent_of_node.left = node_to_delete.right
                else:
                    parent_of_node.right = node_to_delete.right
            elif node_to_delete.right is None:
                if parent_of_node is None:
                    return node_to_delete.left
                if parent_of_node.left == node_to_delete:
                    parent_of_node.left = node_to_delete.left
                else:
                    parent_of_node.right = node_to_delete.left
            else:
                succ = successor(node_to_delete)
                if succ is not None:
                    succ_parent = parent(root, succ)
                    if succ_parent.left == succ:
                        succ_parent.left = succ.right
                    else:
                        succ_parent.right = succ.right
                node_to_delete.val = succ.val
            return root
        
        self.root = delete_node(self.root, val)
        
    def inorder_traversal(self) -> list[int]:
        result = []
        stack = []
        current = self.root
        while stack or current:
            if current:
                stack.append(current)
                current = current.left
            else:
                current = stack.pop()
                result.append(current.val)
                current = current.right
        return result

    def preorder_traversal(self) -> list[int]:
        result = []
        stack = [self.root]
        while stack:
            current = stack.pop()
            if current:
                result.append(current.val)
                stack.append(current.right)
                stack.append(current.left)
        return result
    
    def postorder_traversal(self) -> list[int]:
        result = []
        stack = [(self.root, False)]
        while stack:
            current, visited = stack.pop()
            if current:
                if visited:
                    result.append(current.val)
                else:
                    stack.append((current, True))
                    stack.append((current.right, False))
                    stack.append((current.left, False))
        return result
    
bst = BinarySearchTree()
bst.insert(20)
bst.insert(15)
bst.insert(17)
bst.insert(10)
bst.insert(11)
bst.insert(13)
bst.insert(12)
print(bst.preorder_traversal())