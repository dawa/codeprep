class Solution:
    # @param A : unsigned integer
    # @return an unsigned integer
    def reverse(self, A):
        binary = bin(A)
        reverse = binary[-1:1:-1]
        reverse = reverse + (32 - len(reverse))*'0'
        return int(reverse, 2)
