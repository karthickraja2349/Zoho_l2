                                                                                                23/04/2025/207
1)
Greater on right side
You are given an array Arr of size N. Replace every element with the next greatest element (greatest element on its right side) in the array. Also, since there is no element next to the last element, replace it with -1.
Input:
N = 6
Arr[] = {16, 17, 4, 3, 5, 2}
Output:
17 5 5 5 2 -1

import java.util.Arrays;

class Main{
    public static void main(String[]args){
        int nums[] = {16,17,4,3,5,2};
        int length = nums.length;
        
        int maxFromRight = nums[length-1];
        nums[length-1] = -1;
        
        for(int i=length-2;i>=0;i--){
            int temp = nums[i];
            nums[i] = maxFromRight;
            if(temp > maxFromRight)
              maxFromRight = temp;
        }
        System.out.println(Arrays.toString(nums));
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2)
Given a Boolean matrix mat[M][N] of size M X N, modify it such that if a matrix cell mat[i][j] is 1 then make its adjacent cells as 0.
Input:
1 0 1
0 1 0
1 1 1
Output:
1 0 1
0 0 0
0 0 0

import java.util.List;
import java.util.ArrayList;

class Main {
    public static void main(String[] args) {
        int nums[][] = {
            {1, 0, 1},
            {0, 1, 0},
            {1, 1, 1}
        };
        List<int[]> ones = new ArrayList();
        for (int i = 0; i < nums.length; i++) {
            for (int j = 0; j < nums[0].length; j++) 
                if (nums[i][j] == 1) 
                    ones.add(new int[]{i, j});
        }
        
        for (int[] one : ones) 
            alter(nums, one[0], one[1]);

        for (int[] row : nums) {
            for (int val : row)
                System.out.print(val + " ");
            System.out.println();
        }
    }

    private static void alter(int[][] nums, int row, int col) {
        int[][] directions = {{-1,0},{1,0},{0,-1},{0,1}};
        for (int[] dir : directions) {
            int newRow = row + dir[0];
            int newCol = col + dir[1];
            if (newRow >= 0 && newRow < nums.length && newCol >= 0 && newCol < nums[0].length) 
                nums[newRow][newCol] = 0;
        }
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3)
Equilibrium index of an array is an index such that the sum of elements at lower indexes is equal to the sum of elements at higher indexes. For example, in an array A:
Example :
Input: A[] = {-7, 1, 5, 2, -4, 3, 0}
Output: 3
3 is an equilibrium index, because:
A[0] + A[1] + A[2] = A[4] + A[5] + A[6]
Input: A[] = {1, 2, 3}
Output: -1

int total = 0;
for(int num : nums)
   total+=num;
int leftSum = 0;   
for(int i=0;i<nums.length;i++){
      total-=nums[i];
      if(leftSum==total)
         return i;
       leftSum+=nums[i];  
}
return -1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4)
In MS-Paint, when we take the brush to a pixel and click, the color of the region of that pixel is replaced with a new selected color. Following is the problem statement to do this task.
Given a 2D screen, location of a pixel in the screen and a color, replace color of the given pixel and all adjacent same colored pixels with the given color.
Example:
Input:
       screen[M][N] = {{1, 1, 1, 1, 1, 1, 1, 1},
                      {1, 1, 1, 1, 1, 1, 0, 0},
                      {1, 0, 0, 1, 1, 0, 1, 1},
                      {1, 2, 2, 2, 2, 0, 1, 0},
                      {1, 1, 1, 2, 2, 0, 1, 0},
                      {1, 1, 1, 2, 2, 2, 2, 0},
                      {1, 1, 1, 1, 1, 2, 1, 1},
                      {1, 1, 1, 1, 1, 2, 2, 1},
                      };
    x = 4, y = 4, newColor = 3
The values in the given 2D screen indicate colors of the pixels. x and y are coordinates of the brush, newColor is the color that should replace the previous color on screen[x][y] and all surrounding pixels with same color.
Output:
Screen should be changed to following.
       screen[M][N] = {{1, 1, 1, 1, 1, 1, 1, 1},
                      {1, 1, 1, 1, 1, 1, 0, 0},
                      {1, 0, 0, 1, 1, 0, 1, 1},
                      {1, 3, 3, 3, 3, 0, 1, 0},
                      {1, 1, 1, 3, 3, 0, 1, 0},
                      {1, 1, 1, 3, 3, 3, 3, 0},
                      {1, 1, 1, 1, 1, 3, 1, 1},
                      {1, 1, 1, 1, 1, 3, 3, 1},
                      };
                      
class Main{
    public static void main(String[]args){
        int screen[][] = {
            {1, 1, 1, 1, 1, 1, 1, 1},
            {1, 1, 1, 1, 1, 1, 0, 0},
            {1, 0, 0, 1, 1, 0, 1, 1},
            {1, 2, 2, 2, 2, 0, 1, 0},
            {1, 1, 1, 2, 2, 0, 1, 0},
            {1, 1, 1, 2, 2, 2, 2, 0},
            {1, 1, 1, 1, 1, 2, 1, 1},
            {1, 1, 1, 1, 1, 2, 2, 1}
        };
        int x = 4;
        int y = 3;
        int newColour = 3;
        int originalColour = screen[x][y];
        if(originalColour != newColour)
          dfs(screen,x,y,originalColour,newColour);
        for(int i=0;i<screen.length;i++){
          for(int j=0;j<screen[0].length;j++) 
            System.out.print(screen[i][j] + " ");
          System.out.println();
        }
    }
    
    private static void dfs(int[][]screen,int row,int col,int originalColour,int newColour){
      if(row<0 || row>=screen.length || col<0 || col>=screen[0].length || screen[row][col]!=originalColour)
         return;
     screen[row][col] = newColour;
     
     dfs(screen,row+1,col,originalColour,newColour);
     dfs(screen,row-1,col,originalColour,newColour);
     dfs(screen,row,col+1,originalColour,newColour);
     dfs(screen,row,col-1,originalColour,newColour);
    }
}                      
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5)
Given a matrix of 2D array of n rows and m coloumns. Print this matrix in ZIG-ZAG fashion as shown in figure.
Example:
Input: 
1 2 3
4 5 6
7 8 9
Output: 
1 2 4 7 5 3 6 8 9   

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
6)
Remove the duplicates in the String.
Testcase 1:
Input: Java1234
Output: Javb1234 (Remove the second ‘a’ as it is duplicated)
Testcase 2:
Input: Python1223:
Output: Python1234 (Replace the second 2 with 3, and replace 3 with 4 as 3 is replaced for the duplicated 2)
Testcase 3:
Input: aBuzZ9900
Output: aBuzC9012
(Replace the second ‘Z’ with ‘C’ as ‘a’ and ‘B’ are already there in the String. Replace with capital C as the letter to be replaced is capital Z. The second 9 turns out to be zero and the zero turns out to ‘1’ and the second zero turns out to ‘2’)

class Main{
    public static void main(String[]args){
         String s = "12341";
         StringBuilder result = new StringBuilder();
         boolean[] charMap = new boolean[256];
         
         for(int i=0;i<s.length();i++){
             char ch = s.charAt(i);
             if(charMap[ch]){
                 char newChar = ch;
                 if(Character.isUpperCase(ch))
                     newChar = getChar(ch,'A','Z',charMap);
                 else if(Character.isLowerCase(ch))
                     newChar = getChar(ch,'a','z',charMap);
                 else if(Character.isDigit(ch))
                     newChar = getChar(ch,'0','9',charMap);
                 result.append(newChar);
                 charMap[newChar] = true;
             }
             else{
               charMap[ch] = true;
               result.append(ch);
             }
         }  
    }
    
    private static char getChar(char ch, char start, char end, boolean[] charMap){
            char next = (char) (ch+1);
            while(true){
                 if(next > end)
                    next = start;
                 if(!charMap[next])
                    return next;
                 next++;   
            }
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
7)
 Print whether the version is upgraded, downgraded or not changed according to the input given.
example: Input : Version1 4.8.2 Version2 4.8.4 Output: upgraded, Input : Version1 4.0.2 Version2 4.8.4 Output: downgraded

class Main {
    public static void main(String[] args) {
        String s1 = "4.10.2";
        String s2 = "4.8.4";

        if (s1.equals(s2))
            System.out.println("not changed");
        System.out.println(getVersion(s1, s2));
    }

    private static String getVersion(String s1, String s2) {
        String[] str1 = s1.split("\\.");
        String[] str2 = s2.split("\\.");

        for (int i = 0; i < str1.length; i++) {
            int num1 = Integer.parseInt(str1[i]);
            int num2 = Integer.parseInt(str2[i]);

            if (num1 < num2)
                return "upgraded";
            else if (num1 > num2)
                return "downgraded";
        }
        return "not changed";
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
8)
Print all possible subsets of the given array whose sum equal to given N.
example: Input: {1, 2, 3, 4, 5},  N=6 
Output: {1, 2, 3}, {1, 5}, {2, 4}

import java.util.List;
import java.util.LinkedList;

class Main {
    public static void main(String[] args) {
        int nums[] = {1, 2, 3, 4, 5};
        int n = 6;
        List<List<Integer>> result = new LinkedList<>();
        backTrack(result,new LinkedList<>(),nums,n,0);
        System.out.println(result);
    }

    private static void backTrack(List<List<Integer>> result, List<Integer> list, int nums[], int target, int start) {
        int sum = getSum(list);
        
        if (sum > target)
            return;
        
        if (sum == target) {
            result.add(new LinkedList<>(list));
            return;
        }

        for (int i=start;i<nums.length;i++) {
            list.add(nums[i]);
            backTrack(result,list,nums,target,i+1); 
            list.remove(list.size()-1);
        }
    }

    private static int getSum(List<Integer> list) {
        int sum = 0;
        for (int num : list)
            sum += num;
        return sum;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
9) Reverse the words in the given String1 from the first occurrence of String2 in String1 by maintaining white Spaces.
example: String1 = Input: This is a test String only,  String2 = st 
Output: This is a only String test

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

class Main {
    public static void main(String[] args) {
        String s1 = "This is a test String only";
        String s2 = "st";

        String[] str = s1.split("\\s+");
        StringBuilder result = new StringBuilder();
        List<String> temp = new ArrayList<>();

        boolean flag = false;
        for (String s : str) {
            if (!flag && !s.contains(s2)) 
                result.append(s).append(" ");
            else {
                flag = true;
                temp.add(s);
            }
        }

        Collections.reverse(temp);
        for (String s : temp)
            result.append(s).append(" ");
        System.out.println(result.toString().trim());
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
10)
 calculate Maximum number of chocolates can eat and Number of wrappers left in hand.
Money: Total money one has to spend.
Price: price per chocolate.
wrappers: minimum number of wrappers for exchange choco: number of chocolate for wrappers.
Max visit: Maximum number of times one can visit the shop.(if zero consider it infinite)
example: input: Money:40 Price:1 wrappers:3 choco:1 Max visit:1 
Output: total chocolate can eat: 53 wrappers left in hand:14

class Main {
    public static void main(String[] args) {
        int money = 40;
        int price = 1;
        int wrappersNeeded = 3;
        int chocoPerWrapper = 1;
        int maxVisit = 1;

        int totalChocolates = 0;
        int wrappers = 0;
        int visit = 0;
        
        int chocolatesBought = money / price;
        totalChocolates += chocolatesBought;
        wrappers += chocolatesBought;

        while (wrappers >= wrappersNeeded && (maxVisit == 0 || visit < maxVisit)) {
            int exchanged = (wrappers / wrappersNeeded) * chocoPerWrapper;
            wrappers = (wrappers % wrappersNeeded) + exchanged;
            totalChocolates += exchanged;
            visit++;
        }

        System.out.println("Total chocolates eaten: " + totalChocolates);
        System.out.println("Wrappers left in hand: " + wrappers);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
11)
 Sample Input-
2
Hacker
Rank
Sample Output-
Hce akr
Rn ak

class Main {
    public static void main(String[] args) {
       String s = "Rank";
       
       int i=0;
       int j=1;
       
       StringBuilder result = new StringBuilder();
       
       while(i<s.length()){
           result.append(s.charAt(i));
           i+=2;
       }
       result.append(" ");
       while(j<s.length()){
           result.append(s.charAt(j));
           j+=2;
       }
       System.out.println(result);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
12)
Print the word with odd letters – PROGRAM
Sample Output
P     P
 R   R
  O O
   G
  R R
 A   A
M     M

class Main {
    public static void main(String[] args) {
       String s = "program";
       for(int i=0;i<s.length();i++){
           for(int j=0;j<s.length();j++){
               if(i==j || i+j == s.length()-1)
                 System.out.print(s.charAt(i));
               else
                 System.out.print(" ");
           }
           System.out.println();
       }
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
13)
Sample Input – Alternate Sorting 
Input: {1, 2, 3, 4, 5, 6, 7}
output: {7, 1, 6, 2, 5, 3, 4}

class Main{
     public static void main(String[]args){
         int nums[] = {1,2,3,4,5,6,7};
         int minPosition = 0;
         int maxPosition = nums.length-1;
         int maxElement = nums[maxPosition]+1;
         
         int i=0;
         while(i<nums.length){
               if(i%2==0)
                  nums[i] = nums[i] + (nums[maxPosition--] % maxElement) * maxElement;
               else
                  nums[i] = nums[i] + (nums[minPosition++] % maxElement) * maxElement;
               i++;   
         }
         
         i=0;
         while(i<nums.length)
           nums[i] = nums[i++] / maxElement;
         System.out.println(Arrays.toString(nums));  
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
14) 
Given an array of values persons[], each represents the weight of the persons. There will be infinite bikes available. Given a value K which represents the maximum weight that a bike accommodates. Along with that one more condition, a bike can carry two persons at a time. You need to find out the least number of times, the bike trips are made.

import java.util.Arrays;

class Main{
    public static void main(String[]args){
        int persons[] = {40, 50, 70, 60, 80};
        int k = 100;
        int length = persons.length;
        mergeSort(persons,new int[length],0,length-1);
        int left = 0;
        int right = persons.length-1;
        int trips = 0;
        
        while(left <= right){
            if (persons[left] + persons[right] <= k){
                left++;
                right--;
            }
            else
              right--;
            trips++;      
        }
        System.out.println(trips);
    }
    
    private static  void mergeSort(int []nums,int temp[],int left,int right ){
        if(left >= right)
          return;
        int mid = (left+right)/2;  
        mergeSort(nums,temp,left,mid);  
        mergeSort(nums,temp,mid+1,right);
        merge(nums,temp,left,mid,right);
    }
    
    private static void merge(int nums[], int temp[], int left, int mid,int right){
        int i = left;
        int j = mid+1;
        int k = left;
        
        while(i<=mid && j<=right){
            if (nums[i] <= nums[j])
               temp[k++] = nums[i++];
            else 
               temp[k++] = nums[j++];
        }

        while (i <= mid) 
          temp[k++] = nums[i++];
        while (j <= right) 
          temp[k++] = nums[j++];

        for (int x = left; x <= right; x++) 
            nums[x] = temp[x]; 
        }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                       24/04/2025/206
15)
Assume there exists infinite grid, you’re given initial position x, y. Inputs will be movements either L or R or U or D. After n inputs, you need to give the current position.
Input: 
4 5 //initial position x, y
9 //number of movements
U L R R D D U L R //7 movements
Output:
5 5     

import java.util.Scanner;
class Main{
    public static void main(String[]args){
      Scanner input = new Scanner(System.in);
      System.out.println("Enter the X position:");
      int x = input.nextInt();
      System.out.println("Enter the Y position:");
      int y = input.nextInt();
      System.out.println("Enter value of n:");
      int n = input.nextInt();
      input.nextLine();
      for(int i=0;i<n;i++){
          System.out.println("Enter U/R/D/L:");
          String move = input.nextLine();
          switch(move){
              case "U":
                  y++;
                  break;
              case "R":
                  x++;
                  break;
              case "D":
                  y--;
                  break;
              case "L":
                  x--;
                  break;
          }
      }
      System.out.println(x + " " + y);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
16)
Given a matrix NxN, you are initially in the 0, 0 position. The matrix is filled with ones and zeros. Value “one” represents the path is available, while “zero” represents the wall. You need to find the can you able to reach the (N-1)x(N-1) index in the matrix. You can move only along the right and down directions if there’s “one” available.
Input: 5 //N value
1 0 1 0 0
1 1 1 1 1
0 0 0 1 0
1 0 1 1 1
0 1 1 0 1
Output: Yes

class Main{
    public static void main(String[]args){
        int grid[][]={
            {1,0,1,0,0},
            {1,1,1,1,1},
            {0,0,0,1,0},
            {1,0,1,1,1},
            {0,1,1,0,1}
        };
        System.out.println(canReach(grid,0,0,grid.length));
    }
   
    private static boolean canReach(int grid[][], int x , int y, int n){
        if(x==n-1 && y==n-1)
           return true;
       if(x>=n || y>=n || grid[x][y] == 0)
           return false;
       return canReach(grid,x+1,y,n) || canReach(grid,x,y+1,n);
   }    
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
17)
Given an array of integers, compute the maximum value for each integer in the index, by either summing all the digits or multiplying all the digits. (Choose which operation gives the maximum value)
Input: 5
120 24 71 10 59
Output:
3 8 8 1 45

import java.util.Arrays;
class Main{
    public static void main(String[]args){
        int nums[] = {120,24,71,10,59};
        int result[] = new int[nums.length];
        
        for(int i=0;i<nums.length;i++){
            int element = nums[i];
            int sum = getSum(element);
            int product = getProduct(element);
            
            if(sum > product)
               result[i] = sum;
            else
               result[i] = product;
        }
        System.out.println(Arrays.toString(result));
    }
    
    private static int getSum(int num){
        int sum=0;
        while(num > 0){
            sum+=num%10;
            num/=10;
        }
        return sum;
    }
    
    private static int getProduct(int num){
       int product = 1;
       while(num > 0){
           product*=num%10;
           num/=10;
       }
       return product;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
18)
-1 represents ocean and 1 represents land find the number of islands in the given matrix.
Input:   
n*n matrix
       1 -1 -1  1
      -1  1 -1  1
      -1 -1  1 -1
      -1 -1 -1  1
Output: 2 (two islands that I have bold in matrix at 1, 1 and 2, 2)

class Main{
    public static void main(String[]args){
        int nums[][] = {
            {1,-1,-1,1},
            {-1,-1,-1,1},
            {-1,-1,1,-1},
            {-1,-1,-1,1}
        };
        int count = 0;
        for(int i=0;i<nums.length;i++){
            for(int j=0;j<nums.length;j++){
                if(nums[i][j]==1)
                  if(check(nums,i,j))
                    count++;
            }
        }
        System.out.println(count);
    }
    
    static private boolean check(int nums[][],int row,int column){
        int directions[][] = {{-1,0},{1,0},{0,-1},{0,1}};
        int count = 0;
        
        for(int direction[] : directions){
            int newRow = row+direction[0];
            int newColumn = column+direction[1];
            
            if(newRow < 0 || newRow >= nums.length || newColumn <0 || newColumn >= nums.length || nums[newRow][newColumn] !=-1){
                return false;
            }
            else
             count++;
        }
        if(count==directions.length)
           return true;
        return false;   
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
19)
Print all the possible subsets of array which adds up to give a sum.
Input: array{2, 3, 5, 8, 10}
sum=10
Output: {2, 3, 5},{2, 8},{10}

import java.util.List;
import java.util.LinkedList;

class Main{
    public static void main(String[]args){
        int nums[] = {2,3,5,8,10};
        int sum = 10;
        List<List<Integer>> result = new LinkedList<>();
        backTrack(result,new LinkedList<>(),nums,sum,0);
        System.out.println(result);
    }
    
    private static void backTrack(List<List<Integer>> result,List<Integer> list, int nums[], int sum,int start){
        int currentSum = getSum(list);
        if(currentSum == sum){
            result.add(new LinkedList<>(list));
            return;
        }
        
        for(int i=start;i<nums.length;i++){
            list.add(nums[i]);
            backTrack(result,list,nums,sum,i+1);
            list.remove(list.size()-1);
        }
    }
    
    private static int getSum(List<Integer> list){
        int sum = 0;
        for(int num : list)
          sum+=num;
        return sum;  
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
20)
There is a circular queue of processes. Every time there will be certain no of process skipped and a particular start position. Find the safe position.
Input: Number of process:5
            Start position:3
            Skip: 2nd
Output: 1 will be the safest position
(Logic: 1 2 3 4 5 starting from 3, 5th process will be skipped
        1 2 3 4 5 process 2 will be skipped
        1 2 3 4 5 process 4 will be skipped
        1 2 3 4 5 process 3 will be skipped, so safest process is 1.

import java.util.List;
import java.util.ArrayList;
class Main{
      public static void main(String[]args){
           int n = 5;
           int start = 3;
           int skip = 2;
           
           List<Integer> list = new ArrayList();
           for(int i=1;i<=n;i++)
               list.add(i);
           int index = start-1;
           
           while(list.size()>1){
                index = (index+skip) % list.size();
                list.remove(index);
           }
           System.out.println(list.get(0));
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
21)
Given N. print the following snake pattern (say N = 4). condition:  must not use arrays ( 1D array  or 2D array like Matrix).
1   2   3   4
8   7   6   5
9   10  11  12
16  15  14  13

class Main{
   public static void main(String[]args){
       int n = 4;
       int value = 1;
       
       for(int i=0;i<n;i++){
           if(i%2==0){
              for(int j=0;j<n;j++)
                 System.out.print(value++ + " ");
           }
           else {
                int temp = value + n - 1;
                for(int j=0;j<n;j++){
                    System.out.print(temp-- + " ");
                    value++;
                }
           }
           System.out.println();
       }
   }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                           25/04/2025/205
22)
Given N. print the Latin Matrix (say N = 3). condition:  must not use strings(aka character literals), arrays (both 1D and 2D), inbuilt functions(like rotate).
A   B   C
B   C   A
C   A   B

class Main {
          public static void main(String[]args){
                     int n = 3;
                     for(int i=0;i<n;i++){
                           for(int j=0;j<n;j++){
                                int ch = 65 + (i + j) % n; 
                                System.out.print((char) ch + "\t");
                           }
                           System.out.println();
                     }
          }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
23)
Given a number N. find the minimum count of numbers in which N can be represented as a sum of numbers x1, x2, … xn. where xi is number whose digits are 0s and 1s.
example 
1)  i/p :  N = 33
o/p : count = 3.     33( 11 + 11 + 11 )
some other possibilities of 33 is (11 + 11 + 10 + 1),   (11 + 10 + 10 + 1 + 1 ), (10 + 10 + 10 + 1 + 1 + 1)

import java.util.List;
import java.util.ArrayList;

class Main{
     public static void main(String[]args){
          int n = 33;
          List<Integer> list = new ArrayList();
          for(int i=1;i<=n;i++)
             if(isValidBinary(i))
                list.add(i);
          
          int dp[] = new int[n+1];
          dp[0] = 0;
          for(int i=1;i<=n;i++){
              dp[i] = Integer.MAX_VALUE;
              for(int num : list){
                  if(i>=num && dp[i-num] != Integer.MAX_VALUE)
                       dp[i] = Math.min(dp[i], dp[i-num]+1);
              }
          }
          System.out.println(dp[n]);
     }
     
     private static boolean isValidBinary(int num){
          while(num > 0){
              int digit = num %10;
              if(digit!= 0 && digit!= 1)
                 return false;
             num/=10;   
          }
          return true;
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
24)
Finding all permutations of a string. ( backtracking approach )
ABC = [ABC, ACB, BAC, BCA, CAB, CBA];

import java.util.List;
import java.util.ArrayList;

class Main{
     public static void main(String[]args){
          String s = "ABC";
          List<String> result = new ArrayList();
          boolean[] used = new boolean[s.length()];
          backTrack(result,s,new StringBuilder(), used);
          System.out.println(result);
     }
     
     private static void backTrack(List<String> result, String s , StringBuilder temp, boolean[] used){
            if(temp.length() == s.length()){
                  result.add(temp.toString());
                  return;
            }
            for(int i=0;i<s.length();i++){
              if(used[i])
                continue;
             temp.append(s.charAt(i));
             used[i] = true;
             backTrack(result,s,temp,used);
             temp.deleteCharAt(temp.length()-1);
             used[i] = false;
          }   
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
25)
Given an array of integers, write a program to re-arrange the array in the given form.
1st_largest, 1st_smallest, 2nd_largest, 2nd_smallest, 3rd_largest ……. etc.

import java.util.Arrays;

class Main{
    public static void main(String[]args){
          int nums[] = {1,2,3,4,5,6,7};
          int maxPosition =  nums.length-1;
          int minPosition = 0;
          int max = nums[maxPosition] + 1;
          
          for(int i=0;i<nums.length;i++){
              if(i%2==0)                                                                                                //without % we also use (num&1)==0 for finding even / odd
                 nums[i] = nums[i] + (nums[maxPosition--] % max) * max;
              else
                 nums[i] = nums[i] + (nums[minPosition++] % max) * max;
          }
          for(int i=0;i<nums.length;i++)
             nums[i] = nums[i] / max;
          System.out.println(Arrays.toString(nums));   
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
26)
Sort the given elements in decending order based on the number of factors of each element.
{10, 15, 7, 9, 12}
output
[12, 15, 10, 9, 7] 
10-> 1, 2, 5, 10
15-> 1, 3, 5, 15
7  -> 1, 7
9  -> 1,3,9
12-> 1, 2, 3, 4, 6, 12

import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

class Main{
      public static void main(String[]args){
            int nums[] = {10,15,7,9,12};
            Map<Integer, Integer> map = new HashMap();
            for(int num : nums)
               if(!map.containsKey(num))
                  map.put(num, getFactorCount(num));
            
            Integer[] arr = new Integer[nums.length];
            for(int i=0;i<nums.length;i++)
               arr[i] = nums[i];
               
            Arrays.sort(arr, (a,b) -> {
                  int factorA = map.get(a);
                  int factorB = map.get(b);
                  
                  if(factorA == factorB)
                     return b-a;
                  else
                     return factorB - factorA;
            }
            );
            for (int i = 0; i < nums.length; i++) 
                nums[i] = arr[i];
            System.out.println(Arrays.toString(nums));
      }
      
      private static int getFactorCount(int n){                                      
          int count = 0;
          for(int i=1;i*i<=n;i++){
              if(n%i==0){
                 if(i*i==n)
                    count+=1;
                 else
                   count+=2;
              }
          }
          return count;
      }
      
      (or)
      
      private static int getFactorCount(int n){
          int count = 0;
          for(int i=1;i*i<=n;i++){
              if(n%i==0)
                count++;
          }
          return count;
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
27)
Find whether the given number is palindrome or not. Don’t use arrays or strings

class Main{
    public static void main(String[]args){
        int num = 12121;
        int reversedNum = 0;
        int originalNum = num;
        while(num > 0){
            int digit = num %10;
            reversedNum = reversedNum*10+digit;
            num/=10;
        }
        if(originalNum==reversedNum)
          System.out.println("Palindrome");
        else
          System.out.println("Not a Palindrome");
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
28)
Reverse the given string keeping the position of special characters 
a,b&c#de
output -> e,d&c#ba

class Main{
    public static void main(String[]args){
        String s = "a,b&c#de";
        StringBuilder temp = new StringBuilder(s);
        
        int left = 0;
        int right = s.length()-1;
        
        while(left <= right){
            char leftChar = temp.charAt(left);
            char rightChar = temp.charAt(right);
            
            if(!Character.isLetterOrDigit(leftChar))
               left++;
            else if(!Character.isLetterOrDigit(rightChar))
               right--;
            else{
                temp.setCharAt(left++, rightChar);
                temp.setCharAt(right--, leftChar);
            }  
        }
        System.out.println(temp);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
29)
Find the shortest path from one element to another element in a matrix using right and down moves alone. 

import java.util.List;
import java.util.ArrayList;

class Main{
       public static void main(String[]args){
           int startRow = 2;
           int startColumn = 0;
           int endRow = 4;
           int endColumn = 4;
           
           List<String> path = new ArrayList();
           path.add("(" + startRow +"," + startColumn + ")");
           
           while(startColumn < endColumn){
               startColumn++;
               path.add("(" + startRow +"," + startColumn + ")");
           }
           
           while(startRow < endRow){
              startRow++;
                path.add("(" + startRow +"," + startColumn + ")");
           }
           System.out.println(path);
       }
}
                                      ---------------------------------------------------------------------------------------------------------------------------
//it was total paths
class Main{
    public static void main(String[]args){
        int m = 5;
        int n = 5;
        
        int startRow = 2;
        int startColumn = 0;
        
        int endRow = 4;
        int endColumn = 4;
        
        int row = endRow - startRow + 1;
        int column = endColumn - startColumn + 1;
        
        int dp[][] = new int[row][column];
        
        for(int i=0;i<row;i++){
            for(int j=0;j<column;j++){
                if(i==0 || j==0)
                  dp[i][j] = 1;
                else
                  dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
            }
        }
        System.out.println(dp[row-1][column-1]);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
30)
 Pattern
 i) Diamond pattern
 ------------------------------
 class Main{
     public static void main(String[]args){
         int n=5;
         
         //upper part
         for(int i=1;i<=n;i++){
              for(int j=n;j>i;j--)
                 System.out.print(" ");
              for(int k=1;k<=2*i-1;k++)
                 System.out.print("*");
              System.out.println();   
         }
         
         //lower part
         for(int i=n-1;i>=1;i--){
              for(int j=n;j>i;j--)
                 System.out.print(" ");
              for(int k=1;k<=2*i-1;k++)
                 System.out.print("*");
              System.out.println();   
         }
     }
 }
 
 ii) Hollow Diamond pattern
 ---------------------------------------
 class Main{
       public static void main(String[]args){
             int n=5;
             
             //upper part
             for(int i=1;i<=n;i++){
                  for(int j=n;j>i;j--)
                     System.out.print(" ");
                  for(int k=1;k<=2*i-1;k++){
                     if(k==1 || k==2*i-1)
                        System.out.print("*");
                     else
                        System.out.print(" ");
                  }
                  System.out.println();
             }
             
             //lower part
             for(int i= n-1 ; i>=1;i--){
                   for(int j=n;j>i;j--)
                      System.out.print(" ");
                   for(int k=1;k<=2*i-1;k++){
                      if(k==1 || k==2*i-1)
                         System.out.print("*");
                      else
                         System.out.print(" "); 
                   }
                   System.out.println();
             }
       }
 }
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                            26/04/2025/204
31)
 Pangram Checking
Check whether all english alphabets are present in the given sentence or not
I/P: abc defGhi JklmnOP QRStuv wxyz
O/P: True
I/P: abc defGhi JklmnOP QRStuv
O/P: False

class Main {
    public static void main(String[] args) {
        String s = "abc defGhi JklmnOP QRStuv ";
        int dp[] = new int[26];

        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (Character.isLetter(ch)) {
                ch = Character.toLowerCase(ch); 
                dp[ch - 'a']++;
            }
        }

        for (int num : dp) {
            if (num == 0) {
                System.out.println("Not a pangram");
                return;
            }
        }
        System.out.println("pangram");
    }
}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                 29/4/25/201
32)
Password Strength
Find the strength of the given password string based on the conditions
Four rules were given based on the type and no. of characters in the string.
Weak – only Rule 1 is satisfied or Rule 1 is not satisfied
Medium – Two rules are satisfied
Good – Three rules satisfied
Strong – All Four rules satisfied

I/P: Qw!1        O/P: Weak
I/P: Qwertyuiop  O/P: Medium
I/P: QwertY123       O/P: Good
I/P: Qwerty@123    O/P: Strong

class Main{
    public static void main(String[]args){
        String s = "Qwerty@123"; 
        int capitalCount = 0;
        int smallCount = 0;
        int numberCount = 0;
        int overAllCount = 0;
        int specialCount = 0;
        
        for(int i=0;i<s.length();i++){
            char ch = s.charAt(i);
            if(Character.isUpperCase(ch))
               capitalCount++;
            else if(Character.isLowerCase(ch))
               smallCount++;
            else if(Character.isDigit(ch))
               numberCount++;
            else if(!Character.isLetterOrDigit(ch) && !Character.isWhitespace(ch))
               specialCount++;
            if(!Character.isWhitespace(ch))
              overAllCount++;
        }
        int checkPassword = verifyPassword(capitalCount,smallCount,numberCount,overAllCount,specialCount);
        if(checkPassword==4)
          System.out.println("Strong");
        else if(checkPassword==3)
          System.out.println("Good");
        else if(checkPassword==2)
          System.out.println("Medium");
        else
          System.out.println("weak");
    }
    
    private static int verifyPassword(int capitalCount, int smallCount,int numberCount, int overAllCount,int specialCount){
        if(capitalCount >=1 && smallCount>=1 && numberCount>=1 && overAllCount >= 8 && specialCount>=1)
           return 4;
        else if(capitalCount >=1 && smallCount>=1 && numberCount>=1 && overAllCount >= 8)
           return 3;
        else if(capitalCount >=1 && smallCount>=1 && overAllCount >= 8)   
           return 2;
        else 
           return 1;
    }  
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
33)
 First Occurrences
Given two strings, find the first occurrence of all characters of second string in the first string and
print the characters between the least and the highest index
I/P: ZOHOCORPORATION PORT
O/P: OHOCORPORAT
Explanation: The index of P in first string is 7, O is 1, R is 6 and T is 11. The largest range is 1 – 11.
So print the characters of the first string in this inex range i.e. OHOCORPORAT

class Main{
    public static void main(String[]args){
        String s1 = "ZOHOCORPORATION";
        String s2 = "PORT";
        
        int minimum = Integer.MAX_VALUE;
        int maximum = Integer.MIN_VALUE;
        
        for(int i=0;i<s2.length();i++){
            char ch = s2.charAt(i);
            int index = s1.indexOf(ch);
            if(index < minimum)
              minimum = index;
            if(index > maximum)
              maximum = index;
        }
        System.out.println(s1.substring(minimum,maximum+1));
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
34)
 Matrix Diagonal sum
Given a matrix print the largest of the sums of the two triangles split by diagonal from top right to bottom left
I/P:
3 3
1 2 3
4 5 6
7 8 9
O/P: 38

class Main{
    public static void main(String[]args){
        int [][]nums = {
            {1,2,3},
            {4,5,6},
            {7,8,9}
        };
        
        int leftSum = 0;
        int rightSum = 0;
        
        int n = nums.length;
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                if(i+j < n-1)
                   rightSum+=nums[i][j];
                else if(i+j > n-1)
                   leftSum+=nums[i][j];
                else{
                     leftSum+=nums[i][j];
                     rightSum+=nums[i][j];
                }
          }
       }
       System.out.println(Math.max(leftSum, rightSum));
     }
}   
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
35)
Matrix Addition
Given n integer arrays of different size, find the addititon of numbers represented by the arrays
I/P: 
3 5 4 2
2 4 5
4 5 6 7 8
4 9 2 1
1 2
o/p
54398

import java.util.List;
import java.util.ArrayList;
import java.math.BigInteger;

class Main {
    public static void main(String[] args) {
        List<int[]> list = new ArrayList<>();
        list.add(new int[]{3, 5, 4, 2});
        list.add(new int[]{1, 2});
        list.add(new int[]{2, 4, 5});
        list.add(new int[]{4, 5, 6, 7, 8});
        list.add(new int[]{4, 9, 2, 1});
        
        BigInteger sum = BigInteger.ZERO;
        for(int nums[] : list){
             StringBuilder number = new StringBuilder();
             for(int num : nums)
                 number.append(num);
             sum =  sum.add(new BigInteger(number.toString()));   
        }
        System.out.println(sum);
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
36)
input : aaabbcc
output : abc

class Main{
       public static void main(String[]args){
             String s = "aabbbcc";
             StringBuilder result = new StringBuilder();
             
             for(int i=0;i<s.length();i++){
                 char ch = s.charAt(i);
                 if(result.indexOf(String.valueOf(ch))==-1)
                     result.append(ch);
             }
             System.out.println(result);
       }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
37)
Evaluate the expression and sort and print the output. Getting the input is the tricky part
Input:
Number of input : 4
2*3
2^2^2
35
3*1
Output:
3*1
2*3
2^2^2
35

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

class Main {
    public static void main(String[] args) {
        // Input: List of expressions
        List<String> list = new ArrayList<>();
        list.add("2*3");
        list.add("2^2^2");
        list.add("35");
        list.add("3*1");
        
        // Store expressions along with their evaluated results
        List<Expression> expressions = new ArrayList<>();
        
        // Evaluate and store
        for (String expression : list) {
            int value = getValue(expression);
            expressions.add(new Expression(expression, value));
        }

        // Sort expressions by their evaluated value
        expressions.sort((a, b) -> Integer.compare(a.value, b.value));

        // Print sorted expressions
        for (Expression e : expressions) {
            System.out.println(e.expression);
        }
    }

    // Evaluate the expression
    private static int getValue(String s) {
        // First, handle exponentiation (^) to evaluate right to left
        while (s.contains("^")) {
            int index = s.indexOf("^");
            int left = getLeftOperand(s, index);
            int right = getRightOperand(s, index);
            int value = (int) Math.pow(left, right);
            s = replaceExpression(s, left, right, value, "^", index);
        }

        // Now handle multiplication (left to right)
        while (s.contains("*")) {
            int index = s.indexOf("*");
            int left = getLeftOperand(s, index);
            int right = getRightOperand(s, index);
            int value = left * right;
            s = replaceExpression(s, left, right, value, "*", index);
        }

        // Return the final computed result (only one number will be left in the string)
        return Integer.parseInt(s);
    }

    // Get the left operand before the operator
    private static int getLeftOperand(String s, int index) {
        int leftIndex = index - 1;
        while (leftIndex >= 0 && Character.isDigit(s.charAt(leftIndex))) {
            leftIndex--;
        }
        return Integer.parseInt(s.substring(leftIndex + 1, index));
    }

    // Get the right operand after the operator
    private static int getRightOperand(String s, int index) {
        int rightIndex = index + 1;
        while (rightIndex < s.length() && Character.isDigit(s.charAt(rightIndex))) {
            rightIndex++;
        }
        return Integer.parseInt(s.substring(index + 1, rightIndex));
    }

    // Replace the current operator expression with its computed value
    private static String replaceExpression(String s, int left, int right, int value, String operator, int index) {
        String leftPart = s.substring(0, index - String.valueOf(left).length());
        String rightPart = s.substring(index + String.valueOf(right).length() + 1);
        return leftPart + value + rightPart;
    }

    // Expression class to store both the expression and its evaluated value
    static class Expression {
        String expression;
        int value;

        Expression(String expression, int value) {
            this.expression = expression;
            this.value = value;
        }
    }
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
38)
Given a 6 blocks, of different height h1, …, h6 . Make 2 towers using 3 Blocks for each tower in desired height h1, h2. Print the blocks to be used in ascending order
Input:
1 2 5 4 3  6
height of tower: 6 15
Output :
1 2 3 & 4 5 6

import java.util.Arrays;

class Main {
    public static void main(String[] args) {
        // Given blocks
        int blocks[] = {1, 2, 5, 4, 3, 6};
        
        // Sort blocks to ensure ascending order
        Arrays.sort(blocks);
        
        // First 3 blocks go to tower 1
        // Last 3 blocks go to tower 2
        int[] tower1 = Arrays.copyOfRange(blocks, 0, 3);
        int[] tower2 = Arrays.copyOfRange(blocks, 3, 6);
        
        // Print the result
        System.out.println("Tower 1: " + Arrays.toString(tower1));
        System.out.println("Tower 2: " + Arrays.toString(tower2));
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
39)
Given a 5X5 chess board as input. 9 knights are placed in the board. Print whether the configuration valid or Invalid.

class Main{
    public static void main(String[]args){
        int board[][] = {
            {0,1,0,1,0},
            {0,0,1,0,0},
            {0,1,0,1,0},
            {1,0,1,0,0},
            {0,1,0,1,0}
        };
        if(isValid(board))
          System.out.println("valid board");
        else
          System.out.println("Not a valid Board");
    }
    
    private static boolean isValid(int[][]board){
          int dx[] = {1,2,-1,2,-2,1,-2,-1};
          int dy[] = {2,1,2,-1,1,-2,-1,-2};
          
          for(int i=0;i<board.length;i++){
              for(int j=0;j<board.length;j++){
                  if(board[i][j]==1){
                       for(int k=0;k<8;k++){
                           int newX = i+dx[k];
                           int newY = j+dy[k];
                           if(newX >=0 && newX < board.length && newY >=0 && newY < board.length){
                               if(board[newX][newY] ==1)
                                   return false;
                           }
                       }
                  }
              }
          }
          return true;
    }
}    

// Valid Bishop

import java.util.Set;
import java.util.HashSet;

class Main {
    public static void main(String[] args) {
        int board[][] = {
            {1, 0, 0, 1, 0},
            {0, 1, 0, 0, 1},
            {1, 0, 1, 0, 0},
            {0, 1, 0, 1, 0},
            {1, 0, 0, 1, 0}
        };
        if (isValid(board))
            System.out.println("Valid board");
        else
            System.out.println("Not a valid board");
    }

    private static boolean isValid(int board[][]) {
        // Using sets to track occupied diagonals
        Set<Integer> topLeftBottomRight = new HashSet<>();  // i - j
        Set<Integer> topRightBottomLeft = new HashSet<>();  // i + j
        
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[i].length; j++) {
                if (board[i][j] == 1) {
                    // Check for top-left to bottom-right diagonal
                    if (topLeftBottomRight.contains(i - j)) {
                        return false;
                    }
                    topLeftBottomRight.add(i - j);

                    // Check for top-right to bottom-left diagonal
                    if (topRightBottomLeft.contains(i + j)) {
                        return false;
                    }
                    topRightBottomLeft.add(i + j);
                }
            }
        }
        return true;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
40)
Given a number, print all the code that can be formed with z={a=1, .., z=26}.
1123  
output 
aabc,kbc,aaw,kw,alc
{1, 1, 2, 3} = aabc
{11, 2, 3} = kbc
{1, 1, 23} = aaw
{11, 23} = kw
{1,12,3} = alc;

import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;

class Main{
       public static void main(String[]args){
             int num = 1123;
             String s = String.valueOf(num);
             List<List<String>> resultList = new ArrayList<>();
             backTrack(resultList, new LinkedList<>(),s,0);
             System.out.println(resultList);
             
             List<String> result = new LinkedList<>();
             
             for(List<String> list : resultList){
                  StringBuilder temp = new StringBuilder();
                  for(String str : list){
                       int value = Integer.parseInt(str);
                       char ch = (char) (value+'a'-1);
                       temp.append(String.valueOf(ch));
                  }
                  result.add(temp.toString());
             }
             System.out.println(result);
       }
       
       private static void backTrack(List<List<String>> resultList, List<String> list , String s , int start){
              if(start==s.length()){
                    resultList.add(new LinkedList<>(list));
                    return;
              }
              
              for(int i=start;i<s.length();i++){
                   String number = s.substring(start,i+1);
                   int num = Integer.parseInt(number);
                   if(num >=0 && num <=26){
                        list.add(number);
                        backTrack(resultList, list, s,i+1);
                        list.remove(list.size()-1);
                   }
              }
       }
} 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
41)
Given a String with or without special characters find if it is Palindrome or Not.. No splitting of array must be done or No additional spaces must be used 
Eg: RACE CAR
Eg: I DID, DID I ?

class Main{
          public static void main(String[]args){
                String s = "  R a c e C  a r ";
               if(isPalindrome(s))
                 System.out.println("Palindrome");
              else  
                 System.out.println("Not a palindrome");  
          }
          
          private static boolean isPalindrome(String  s){
                int left = 0;
                int right = s.length()-1;
                
                while(left < right){
                      char leftChar = s.charAt(left);
                      char rightChar = s.charAt(right);
                      
                      if(!Character.isLetter(leftChar)){
                              left++;
                              continue;
                      }
                      if(!Character.isLetter(rightChar)){
                             right--;
                             continue;
                      }
                      
                      if(Character.isLetter(leftChar) && Character.isLetter(rightChar) && Character.toLowerCase(leftChar) !=
                                                                 Character.toLowerCase(rightChar))
                              return false;
                      left++;
                      right--;
                }
                return true;
          }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
42)
Given an array of integers of size n. Convert the array in such a way that if next valid number is same as current number, double its value and replace the next number with 0. After the modification, rearrange the array such that all 0’s are shifted to the end.
Input : arr[] = {2, 2, 0, 4, 0, 8}
Output : 4 4 8 0 0 0
Input : arr[] = {0, 2, 2, 2, 0, 6, 6, 0, 0, 8}
Output : 4 2 12 8 0 0 0 0 0 0

import java.util.Arrays;

class Main{
    public static void main(String[]args){
         int nums[] = {2, 2, 0, 4, 0, 8};
         for(int i=0;i<nums.length;i++){
               if(i+1 < nums.length){
                     int num1 = nums[i];
                     int num2 = nums[i+1];
                     if(num1==num2){
                         nums[i] = num1*2;
                         nums[i+1] = 0;
                     }
               }
         }
         System.out.println(Arrays.toString(nums));
         shiftZeros(nums);
         System.out.println(Arrays.toString(nums));
    }
    
    private static void shiftZeros(int nums[]){
          int index = 0;
          for(int i=0;i<nums.length;i++){
               if(nums[i]!=0){
                   if(i!=index){
                         int temp = nums[i];
                         nums[i] = nums[index];
                         nums[index] = temp;
                   }
                   index++;
               }
          }
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
43)
TWISTED PRIME NUMBER
A number is said to be twisted prime if it is a prime number and reverse of the number is also a prime number.
Input : 97
Output : Twisted Prime Number
Explanation: 97 is a prime number and its reverse 79 is also a prime number.

class Main{
    public static void main(String[]args){
        int num = 79;
        int originalNum = num;
        int twistedNum = 0;
        
        while(num > 0){
            int digit = num%10;
            twistedNum = twistedNum*10 + digit;
            num/=10;
        }
        
        if(isPrime(originalNum) && isPrime(twistedNum))
          System.out.println("Valid Twisted Prime Number");
        else
          System.out.println("Not a Valid Twisted Prime Number");
    }
    
    private static boolean isPrime(int num){
          if(num <=1)
              return false;
          if(num==2)
              return true;
          if(num%2==0)
              return false;
          for(int i=3;i<Math.sqrt(num);i+=2)
               if(num%i==0)
                    return false;
          return true;          
    }
}    
// power of 3
public boolean isPowerOfTwo(int num){
      if(num<=0)
          return false;
      while(num%3==0)
           num/=3;
      return num==1;     
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
44)
Given an array A[] and a number x, check for pair in A[] with sum as x.
Eg : Input {1, 2, 4, 3, 5, 6}
SUM : 5
Output : 2 (1, 4) & (2, 3)

import java.util.Set;
import java.util.HashSet;

class Main{
    public static void main(String[]args){
        int nums[] = {1, 2, 4, 3, 5, 6};
        int sum = 5;
        Set<Integer> seen = new HashSet<>();
        Set<String> pairs = new HashSet<>();
        
        for(int num : nums){
             int complement = sum - num;
             if(seen.contains(complement)){
                    int a = Math.min(num,complement);
                    int b = Math.max(num, complement);
                    pairs.add(a + " " + b);
             }
             seen.add(num);
        }
         System.out.println("Number of pairs: " + pairs.size());
        System.out.println("Pairs: " + pairs);
    }
}    
                                                  (or)
import java.util.Arrays;

class Main {
    public static void main(String[] args) {
        int[] nums = {1, 2, 4, 3, 5, 6};
        int sum = 5;

        Arrays.sort(nums); 
        int left = 0;
        int right = nums.length - 1;
        int count = 0;

        while (left < right) {
            int currentSum = nums[left] + nums[right];
            if (currentSum == sum) {
                System.out.println("(" + nums[left] + ", " + nums[right] + ")");
                count++;
                left++;
                right--;
            } 
            else if (currentSum < sum) {
                left++;
            } 
            else {
                right--;
            }
        }
        System.out.println("Number of pairs: " + count);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
45)
Largest Sum Contiguous Subarray
(Kadane’ Algorithm )
nums[] = {5,4,-1,7,8}
output = 23

class Main{
    public static void main(String[]args){
        int nums[] = {5,4,-1,7,8};
        int sum = nums[0];
        int currentSum = nums[0];
        for(int i=1;i<nums.length;i++){
            currentSum = Math.max(currentSum+nums[i], nums[i]);
            sum = Math.max(sum, currentSum);
        }
        System.out.println(sum);
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
46)
 Diamond pattern : for given input size -> Here 3
   *
  ***
*****
  ***
    *
class Main{
    public static void main(String[]args){
        int n=3;
        
        //upper part
        for(int i=1;i<=n;i++){
            for(int j=n;j>i;j--)
               System.out.print(" ");
            for(int k=1;k<=2*i-1;k++)
                System.out.print("*");
            System.out.println();    
        }
        
        //lower part
        for(int i=n-1;i>=1;i--){
            for(int j=n;j>i;j--)
                System.out.print(" ");
            for(int k=1;k<=2*i-1;k++)
                System.out.print("*");
            System.out.println();    
        }
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
47)
(leetcode 44)
Given a text and a wildcard pattern, implement wildcard pattern matching algorithm that finds if wildcard pattern is matched with text. The matching should cover the entire text (not partial text).
The wildcard pattern can include the characters ‘?’ and ‘*’
‘?’ – matches any single character
‘*’ – Matches any sequence of characters (including the empty sequence)
Example:
Text = “baaabab”,
Pattern = “*****ba*****ab”,
output : true
Pattern = “baaa?ab”, output : true
Pattern = “ba*a?”, output : true
Pattern = “a*ab”, output : false

class Main{
        public static void main(String[]args){
              String text = "baaabab";
              String pattern = "*****ba*****ab";
              if(isMatch(text,pattern))
                    System.out.println("Valid match");
              else
                   System.out.println("Not a valid match");
        }
        
        private static boolean isMatch(String s, String p){
               int m = s.length();
               int n  = p.length();
               
               boolean dp[][] = new boolean[m+1][n+1];
               dp[0][0] = true;
               
               for(int j=1;j<=n;j++){
                     if(p.charAt(j-1)=='*')
                         dp[0][j] = dp[0][j-1];
                     else
                         break;
               }
               
               for(int i=1;i<=m;i++){
                   for(int j=1;j<=n;j++){
                       if(s.charAt(i-1)==p.charAt(j-1) || p.charAt(j-1)=='?')
                             dp[i][j] = dp[i-1][j-1];
                       else if(p.charAt(j-1)=='*')
                             dp[i][j] = dp[i-1][j] || dp[i][j-1];
                   }
               }
               return dp[m][n];
        }
}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
48)
Given an input string and a dictionary of words, find out if the input string can be segmented into a space-separated sequence of dictionary words. See following examples for more details.
Consider the following dictionary 
{ i, like, sam, sung, samsung, mobile, ice, 
  cream, icecream, man, go, mango}

Input:  ilike
Output: Yes 
The string can be segmented as "i like".

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;

class Main{
     private static Map<String, Boolean> map = new HashMap();
     
     public static void main(String[]args){
          List<String> wordDict = new ArrayList<>();
          String str[] = {"i","like","sam","sung","samsung","mobile", "ice","cream","icecream","man","go","mango"};
          wordDict.addAll(Arrays.asList(str));
          
          String s = "mansam";
          System.out.println(wordBreak(s,wordDict));
     }
     
     private static boolean wordBreak(String s, List<String> wordDict){
            if(wordDict.contains(s))
                return true;
            if(map.containsKey(s))
                return map.get(s);
            for(int i=1;i<s.length();i++){
               String left = s.substring(0,i);
               if(wordDict.contains(left) && wordBreak(s.substring(i+1), wordDict)){
                     map.put(s,true);
                     return true;
               }
            }
            map.put(s,false);
            return false;         
     }
}

//Alternate question

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;

class Main{
     private static Map<String, List<String>> map = new HashMap<>();
     
     public static void main(String[]args){
          List<String> wordDict = new ArrayList<>();
          String str[] = {"i","like","sam","sung","samsung","mobile", "ice","cream","icecream","man","go","mango"};
          wordDict.addAll(Arrays.asList(str));
          
          String s = "samman";
          System.out.println(wordBreak(s,wordDict));
     }
     
     private static List<String> wordBreak(String s, List<String> wordDict){
            List<String> list = new ArrayList<>();
            if(wordDict.contains(s))
                 list.add(s);
            if(map.containsKey(s))
                 return map.get(s);
            for(int i=1;i<s.length();i++){
                String left = s.substring(0,i);
                if(wordDict.contains(left)){
                   List<String> subList = wordBreak(s.substring(i), wordDict);
                   for(String str : subList)
                       list.add(left + " " + str);
                }
            }
            map.put(s,list);
            return list;
     }
}     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
49)
Print the following pattern
   1  
  3 2
 6 5 4
10 9 8 7
10 9 8 7 
 6 5 4 
  3 2 
   1
class Main{
    public static void main(String[]args){
        int n = 4;
        int count = 0;
        
        for(int i=1;i<=n;i++){
            for(int j=n;j>i;j--)
              System.out.print(" ");
            count+=i;
            for(int j=1;j<=i;j++){
              System.out.print(count+" ");
              if(j<i)
                count--;
              else
                count+=i-1;
            }
            System.out.println();
        }
        
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j < i; j++) 
                System.out.print(" ");
            for (int j = i; j <= n; j++) {
                System.out.print(count+" ");
                count--;
            }
            System.out.println();
        }        
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
50)
 Given an array as input, The condition is if the number is repeated you must add the number and put the next index value to 0. If the number is 0 print it at the last.
Eg: arr[] = { 0, 2, 2, 2, 0, 6, 6, 0, 8}
Output: 4 2 12 8 0 0 0 0 0 .

import java.util.Arrays;

class Main{
    public static void main(String[]args){
         int nums[] = {2, 2, 0, 4, 0, 8};
         for(int i=0;i<nums.length;i++){
               if(i+1 < nums.length){
                     int num1 = nums[i];
                     int num2 = nums[i+1];
                     if(num1==num2){
                         nums[i] = num1*2;
                         nums[i+1] = 0;
                     }
               }
         }
         System.out.println(Arrays.toString(nums));
         shiftZeros(nums);
         System.out.println(Arrays.toString(nums));
    }
 
    private static void shiftZeros(int nums[]){
          int index = 0;
          for(int i=0;i<nums.length;i++){
               if(nums[i]!=0){
                   if(i!=index){
                         int temp = nums[i];
                         nums[i] = nums[index];
                         nums[index] = temp;
                   }
                   index++;
               }
          }
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                            30/4/25/200
51)
Given two Strings s1 and s2, remove all the characters from s1 which is present in s2.
Input: s1=”expErIence”, s2=”En”
output: s1=”exprIece”

class Main {
    public static void main(String[] args) {
        String s1 = "expErIence";
        String s2 = "En";
        StringBuilder result = new StringBuilder(); 
        for(int i=0;i<s1.length();i++){
            char ch = s1.charAt(i);
            if(s2.indexOf(ch)==-1)
                  result.append(ch);
        }
        System.out.println(result);
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
52)
Find the next greater element for each element in given array.

public class GreaterOnRightSide {
    private static void nextGreatest(int arr[], int n) {
        int max = -1;
        int temp;

        for(int i = n-1; i >= 0; i--) {
            temp = arr[i];         
            arr[i] = max;          
            max = Math.max(max, temp); 
        }
    }

    public static void main(String[] args){
        int arr[] = {16,17,4,3,5,2};
        int n = arr.length;
        nextGreatest(arr, n);

        for(int i = 0; i < n; i++)
            System.out.print(arr[i] + " ");
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
53)
Print all distinct permutations of a given string with duplicate characters.

import java.util.Set;
import java.util.HashSet;
import java.util.Arrays;

class Main{
    public static void main(String[]args){
        String s = "ABA";
        Set<String> result = new HashSet<>();
        boolean[] used = new boolean[s.length()];
        char ch[] = s.toCharArray();
        Arrays.sort(ch);
        s = new String(ch);
        backTrack(result,new StringBuilder(),s,used);
        System.out.println(result);
    }
    
    private static void backTrack(Set<String>result,StringBuilder temp,String s, boolean[] used){
        if(temp.length()==s.length()){
            result.add(temp.toString());
            return;
        }
        
        for(int i=0;i<s.length();i++){
            if(used[i] || (i>0 && s.charAt(i)==s.charAt(i-1) && !used[i-1]))
              continue;
            temp.append(s.charAt(i));
            used[i] = true;
            backTrack(result,temp,s,used);
            temp.deleteCharAt(temp.length()-1);
            used[i] = false;
        }
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
54)
Given a number, find the next smallest palindrome.

class Main{
    public static void main(String[]args){
        int num = 233;
        System.out.println(nextPalindrome(num));
    }
    
    private static int nextPalindrome(int num){
        num++;
        while(true){
            if(isPalindrome(num))
              return num;
            num++;  
        }
    }
    
    private static boolean isPalindrome(int num){
        String s = String.valueOf(num);
        int left = 0;
        int right = s.length()-1;
        
        while(left < right){
            if(s.charAt(left)!=s.charAt(right))
              return false;
            left++;
            right--;
        }
        return true;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
55)
Given an array with repeated numbers, Find the top three repeated numbers.
input: array[]={3, 4, 2, 3, 16, 3, 15, 16, 15, 15, 16, 2, 3}
output: 3, 16, 15

import java.util.Map;
import java.util.HashMap;

class Main {
    public static void main(String[] args) {
        int nums[] = {3,4,2,3,16,3,15,16,15,15,16,2,3};
        Map<Integer, Integer> map = new HashMap<>();

        for (int num : nums)
            map.put(num, map.getOrDefault(num,0)+1);

        int firstMaxElement = -1;
        int secondMaxElement = -1;
        int thirdMaxElement = -1;
        
        int firstMax = -1; 
        int secondMax = -1;
        int thirdMax = -1;
        
        for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
            int key = entry.getKey();
            int value = entry.getValue();
            
            if(value > firstMax){
                   thirdMax = secondMax;
                   thirdMaxElement = secondMaxElement;
                   secondMax = firstMax;
                   secondMaxElement = firstMaxElement;
                   firstMax = value;
                   firstMaxElement = key;
            }
            else if(value > secondMax){
                   thirdMax = secondMax;
                   thirdMaxElement = secondMaxElement;
                   secondMax = value;
                   secondMaxElement = key;
            }
            else if(value > thirdMax){
                   thirdMax = value;
                   thirdMaxElement = key;
            }
       }     
       System.out.println(firstMaxElement);
       System.out.println(secondMaxElement);
       System.out.println(thirdMaxElement);
   }
}   
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
56)
Given two dimensional matrix of integer and print the rectangle can be formed using given indices and also find the sum of the elements in the rectangle
Input: mat[M][N] = {{1, 2, 3, 4, 6}, {5, 3, 8, 1, 2}, {4, 6, 7, 5, 5}, {2, 4, 8, 9, 4} };
index = (2, 0) and (3, 4)
Output:
Rectangle
4 6 7 5 5
2 4 8 9 4
sum 54

class Main {
    public static void main(String[] args) {
        int matrix[][] = {
            {1, 2, 3, 4, 6},
            {5, 3, 8, 1, 2},
            {4, 6, 7, 5, 5},
            {2, 4, 8, 9, 4}
        };

        int indices[][] = {{2, 0}, {3, 4}};
        int sum=0;
        
        if (isValidIndex(indices, matrix.length, matrix[0].length)) {
               for(int i=indices[0][0]; i<=indices[1][0];i++){
                     for(int j=indices[0][1]; j<=indices[1][1];j++){
                          System.out.println(matrix[i][j] + " " );
                          sum+=matrix[i][j];
                     }
                     System.out.println();
               }
        }
        else
            System.out.println("Invalid Index");
        System.out.println("-----------------------");
        System.out.println("Sum is :" + sum);
   }
   
   private static boolean isValidIndex(int[][] indices, int row, int column){
           int startRow = indices[0][0];
           int endRow = indices[1][0];
           int startColumn = indices[0][1];
           int endColumn = indices[1][1];
           
           return (startRow >= 0 && startColumn >= 0 && endRow < row && endColumn < column);
   }
}   
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
57)
Find the result subtraction, multiplication, division of two integers using + operator.
Input: 6 and 4
output:
addition 6+4 = 10,    subtraction  6+(-4) = 2,   multiplication = 24,   division = 1
Input : -8 and -4
Output:
addition -8+(-4) = -12,    subtraction  (-8)+(-(-4)) = -4,   multiplication = 32,   division = 2

class Main {
    public static void main(String[] args) {
        int num1 = -8;
        int num2 = -4;
        System.out.println(add(num1, num2));      
        System.out.println(subtract(num1, num2)); 
        System.out.println(multiply(num1, num2)); 
        System.out.println(divide(num1, num2));   
    }
    
    private static int add(int m, int n) {
        return m + n;
    }
    
    private static int subtract(int m , int n){
        int result = 0;
        if(m > n){
            while(n>0){
               result++;
               n--;
            }
            return m-result;
        }
        else{
            while(m>0){
                result++;
                m--;
            }
            return n-result;
        }
    }
             
    private static int multiply(int m , int n){
           int result = 0;
           int times = Math.abs(n);
           
           for(int i=0;i<times;i++)
              result+=Math.abs(m);
           
           if((m<0 && n>0) || (m>0 && n<0))
             result-=result;
           return result;  
    }
    
    private static int divide(int m, int n){
          if(n==0)
              throw new ArithmeticException("Cannot divide by zero");
          boolean isNegative = (m<0) ^ (n<0);    
          int a = Math.abs(m);
          int n = Math.abs(n);
          int quotient = 0;
          
          while (a >= b) {
            int temp = b;
            int count = 1;

            // Double temp as long as temp * 2 <= a
            while (temp + temp <= a) {
                temp += temp;
                count += count;
            }
            a -= temp;
            quotient += count;
        }
        return isNegative ? -quotient : quotient;
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
58)
Given a sentence of string, in that remove the palindrome words and print the remaining.
Input:
He did a good deed
Output:
He good
Input:
Hari speaks malayalam
Output:
Hari speaks

class Main {
    public static void main(String[] args) {
        String s = "He did a good deed";
        String str[] = s.split("\\s+");  
        StringBuilder result = new StringBuilder();
        
        boolean isFirstWord = true;  
        for (String word : str) {
            if (!isPalindrome(word)) {
                if (isFirstWord) {
                    result.append(word);   
                    isFirstWord = false;
                }
                else 
                    result.append(" ").append(word);
            }
        }
        System.out.println(result);
    }

    private static boolean isPalindrome(String word) {
        int left = 0;
        int right = word.length()-1;
        
        while (left < right) 
            if (word.charAt(left++) != word.charAt(right--))
                return false;
        return true;
   }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
59)
Given two dates, find total number of days between them.
Input: dt1 = {10, 2, 2014} dt2 = {10, 3, 2015}
Output: 393
dt1 represents “10-Feb-2014” and dt2 represents “10-Mar-2015” The difference is 365 + 28
Input: dt1 = {10, 2, 2000} dt2 = {10, 3, 2000}
Output: 29 (Note that 2000 is a leap year)

Input: dt1 = {10, 2, 2000} dt2 = {10, 2, 2000}
Output: 0 (Both dates are same)

Input: dt1 = {1, 2, 2000}; dt2 = {1, 2, 2004};
Output: 1461 (Number of days is 365*4 + 1)

class Main{
    public static void main(String[]args){
        int[] dt1 = {1, 2, 2000}; 
        int[] dt2 = {1, 2, 2004};
        System.out.println("Total days between: " + getDaysBetween(dt1, dt2));
    }
    
    public static int getDaysBetween(int dt1[], int dt2[]){
        int totalDays1 = getTotalDays(dt1[0], dt1[1], dt1[2]);
        int totalDays2 = getTotalDays(dt2[0], dt2[1], dt2[2]);
        return Math.abs(totalDays2-totalDays1);
    }
    
    private static int getTotalDays(int day, int month, int year){
           int totalDays = 0;
           int days[] = {31,28,31,30,31,30,31,31,30,31,30,31};
           
           totalDays+=day;
           totalDays+=(year-1)*365;
           totalDays+=countLeapYear(year);
           for(int i=0;i<month-1;i++){
                totalDays+=days[i];
                 if(i==1 && isLeapYear(year))
                    totalDays++;
           }
           return totalDays;
    }
    
    private static int countLeapYear(int year){
           return year/4 - year/100 + year/400;
    }
    
    private static boolean isLeapYear(int year){
           return (year%4 == 0 && year%100 != 0) || (year%400==0); 
    }
}       
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
60)
Let 1 represent ‘A’, 2 represents ‘B’, etc. Given a digit sequence, count the number of possible decodings of the given digit sequence.
Examples:
Input: digits[] = “121”
Output: 3 // The possible decodings are “ABA”, “AU”, “LA”
Input: digits[] = “1234” Output: 3
// The possible decodings are “ABCD”, “LCD”, “AWD”

class Main{
    public static void main(String[]args){
        String s = "121";
        int dp[] = new int[s.length()+1];
        dp[0] = 1;
        dp[1] = s.charAt(0)=='0' ? 0 : 1;
        
        for(int i=2;i<=s.length();i++){
             String oneDigitString = s.substring(i-1,i);
             String twoDigitString = s.substring(i-2,i);
             
             int oneDigit = Integer.parseInt(oneDigitString);
             int twoDigit = Integer.parseInt(twoDigitString);
             
             if(oneDigit >=1)
                dp[i]+=dp[i-1];
             if(twoDigit > 9 && twoDigit<=26)
                dp[i]+=dp[i-2];
        }
        System.out.println(dp[dp.length-1]);
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
61)
Print all possible words from phone digits
digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
digits = ""
Output: []
Input: digits = "2"
Output: ["a","b","c"]

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

class Main{
    public static void main(String[]args){
        String digits = "23";
        Map<Character, String> phoneMap = new HashMap<>();
        phoneMap.put('2',"abc");
        phoneMap.put('3',"def");
        phoneMap.put('4',"ghi");
        phoneMap.put('5',"jkl");
        phoneMap.put('6',"mno");
        phoneMap.put('7',"pqrs");
        phoneMap.put('8',"tuv");
        phoneMap.put('9',"wxyz");
        System.out.println(letterCombinations(digits,phoneMap));
    }
    
    private static List<String> letterCombinations(String digits, Map<Character,String> phoneMap){
         List<String> result = new ArrayList<>();
         backTrack(result, digits, new StringBuilder(), phoneMap, 0);
         return result;
    }
    
    private static void backTrack(List<String> result, String s, StringBuilder temp, Map<Character,String> map, int index){
           if(index==s.length()){
               result.add(temp.toString());
               return;
           }
           String digits = map.get(s.charAt(index));
           for(int i=0;i<digits.length();i++){
               temp.append(digits.charAt(i));
               backTrack(result,s,temp,map,index+1);
               temp.deleteCharAt(temp.length()-1);
           }
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
62)
Print longest sequence between same character

Ex I/p abcccccbba
O/p 8 (from a to a)
I/p aaaaaaaa
O/p 6

class Main{
    public static void main(String[]args){
          String s = "abcccccbba";
          int length = s.length();
          int max = -1;
          
          for(int i=0;i<length;i++)
             for(int j=length-1;j>i;j--)
                if(s.charAt(i) == s.charAt(j)){
                     max = Math.max(max , j-i-1);
                     break;
                }
          System.out.println("Max Length is :"+max);
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
63)
sort the array odd numbers in ascending and even numbers in descending.
I/p 5 8 11 6 2 1 7
O/p 1 5 7 11 8 6 2

import java.util.Arrays;

class Main{
        public static void main(String[]args){
              int nums[] = {5, 8, 11, 6, 2, 1, 7};
              
              int evenCount = 0;
              for(int num : nums)
                 if(num%2==0)
                     evenCount++;
              int oddCount = nums.length - evenCount;
              
              int evenNums[] = new int[evenCount];
              int oddNums[] = new int[oddCount];
              
              int evenIndex = 0;
              int oddIndex = 0;
              for(int num : nums){
                  if(num%2==0)
                      evenNums[evenIndex++] = num;
                  else
                     oddNums[oddIndex++] = num;
              }
              
              mergeSort(oddNums,1);
              mergeSort(evenNums,2);
              
              int index = 0;       
              for(int i=0;i<oddNums.length;i++)
                  nums[index++] = oddNums[i];
              for(int i=0;i<evenNums.length;i++)
                  nums[index++] = evenNums[i];
              System.out.println(Arrays.toString(nums));           
        }
        
        private static void mergeSort(int nums[] , int sortByValue){
              int temp[] = new int[nums.length];
              mergeSort(nums,temp,0,nums.length-1,sortByValue);
        }
        
        private static void mergeSort(int nums[], int temp[], int left, int right, int sortByValue){
              if(left >= right)
                 return;
              int mid  = (left+right)/2;
              mergeSort(nums,temp,left,mid,sortByValue);
              mergeSort(nums,temp,mid+1,right,sortByValue);
              merge(nums,temp,left,mid,right,sortByValue);
        }
        
        private static void merge(int nums[], int temp[], int left, int mid, int right, int sortByValue){
             int i = left;
             int j = mid+1;
             int k = left;
             
             while(i<=mid && j<=right){
                  if(sortByValue == 1){
                         if(nums[i] <= nums[j])
                               temp[k++] = nums[i++];
                         else
                              temp[k++] = nums[j++];
                  }
                  else {
                       if(nums[i] > nums[j])
                              temp[k++] = nums[i++];
                       else
                             temp[k++] = nums[j++];
                  }
             }
             
             while(i<=mid)
                   temp[k++] = nums[i++];
                   
             while(j<=right)
                    temp[k++] = nums[j++];
              
              for(int x = left ; x<=right;x++)
                   nums[x] = temp[x];
        }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
64)
It’s about anagram.i/p was array of strings .and a word was given to find whether it has anagram in given array.
I/p catch, got, tiger, mat, eat, Pat, tap, tea
Word: ate
O/p eat, tea

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

class Main{
    public static void main(String[]args){
        String[] words = {"catch", "got", "tiger", "mat", "eat", "Pat", "tap", "tea"};
        String target = "ate";
        List<String> result = findAnagrams(words,target);
        System.out.println(result);
    }
    
    private static List<String> findAnagrams(String[] words, String target){
         List<String> list = new ArrayList<>();
         target = sortString(target.toLowerCase());
         for(String word : words)
              if(target.length() == word.length() && target.equals(sortString(word.toLowerCase())))
                    list.add(word);
         return list;           
    }
    
    private static String sortString(String word){
         char ch[] = word.toCharArray();
         Arrays.sort(ch);
         return new String(ch);
    }
}    

//Another logic to check Anagram ,not  a solution for the above problem
public boolean isAnagram(String s, String t){
        s=s.toLowerCase();
        s=s.replace(" ","");
        t=t.toLowerCase();
        t=t.replace(" ","");
        int freq[] = new int[26];
        for(int i=0;i<s.length();i++)
           freq[s.charAt(i)-'a']++;
        for(int i=0;i<t.length();i++)
           freq[t.charAt(i)-'a']--;   
        for(int count : freq)
             if(count!=0)
                  return false;
        return false;
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
65)
array of numbers were given to find a number which has same sum of numbers in it’s either side.
I/p 1, 2, 3, 7, 6
O/p 7(has 1+ 2+3 in left 6 in right)

import java.util.List;
import java.util.ArrayList;

class Main{
    public static void main(String[]args){
        int nums[] = {1,2,3,7,6};
        List<Sum> list = new ArrayList<>();
        for(int i=0;i<nums.length;i++){
            int element = nums[i];
            int leftSum = getLeftSum(nums,i);
            int rightSum = getRightSum(nums,i);
            Sum sum = new Sum(element,leftSum,rightSum);
            list.add(sum);
        }
        
        for(Sum sum : list){
            if(sum.left==sum.right)
              System.out.println(sum.element);
        }
    }
    
    private static int getLeftSum(int nums[], int index){
        int sum = 0;
        for(int i=0;i<index;i++)
          sum+=nums[i];
        return sum;  
    }
    
    private static int getRightSum(int nums[], int index){
        int sum = 0;
        for(int i=index+1;i<nums.length;i++)
           sum+=nums[i];
        return sum;   
    }
}

class Sum{
    int element;
    int left;
    int right;
    
    public Sum(int element,int left , int right){
        this.element = element;
        this.left = left;
        this.right = right;
    }
}

// Optimised Way O(n)

class Main{
    public static void main(String[]args){
        int nums[] = {1,2,3,7,6};
        int totalSum = 0;
        for(int num : nums)
           totalSum+=num;
        int leftSum = 0;
        for(int i=0;i<nums.length;i++){
           int rightSum = totalSum - leftSum - nums[i];
           if(rightSum == leftSum){
               System.out.println(nums[i]);
               break;
           }
           leftSum+=nums[i];
        }
   }
}   
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
66)
prime number – print n prime numbers

class Main{
      public static void main(String[]args){
           int n = 20;
           for(int i=1;i<=n;i++)
               if(isPrime(i))
                   System.out.println(i);
      }
      
      private static boolean isPrime(int num){
           if(num<=1)
              return false;
           if(num==2)
              return true;
           if(num%2==0)
              return false;
           for(int i=3;i*i<=num;i++)
               if(num%i==0)
                  return false;
           return true;       
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
67)
prime factor – sort the array based on the minimum factor they have.
nums[] = 5,10,23,11,45
output = [5, 11, 23, 10, 45]
5->2
10->4
23->2
11->2
45->6

import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

class Main{
    public static void main(String[]args){
        int nums[] = {5,10,23,11,45};
        
        Map<Integer,Integer> map = new HashMap<>();
        for(int num : nums)
            map.put(num, getFactorCount(num));
        
        Integer[] arr = new Integer[nums.length];
        int index = 0;
        for(int num : nums)
           arr[index++] = num;
        
        Arrays.sort(arr , (a,b) -> {
               int factorA = map.get(a);
               int factorB = map.get(b);
               
               if(factorA < factorB)
                   return factorA - factorB;
               return a-b;    
        });
        
        index = 0;
        for(int num : arr)
           nums[index++] = num;
        System.out.println(Arrays.toString(nums));   
    }
    
    private static int getFactorCount(int num){
           int count = 0;
           for(int i=1;i<=Math.sqrt(num);i++){
                if(num%i==0){
                    count++;
                    if(i != num/i)
                       count++;
                }
           }
           return count;
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
68)
Adding a digit to all the digits of a number 
Eg - digit=4, number = 2875, o/p= 612119

class Main{
    public static void main(String[]args){
        int digit = 4;
        int number = 2872135;
        String num = String.valueOf(number);
        
        StringBuilder temp = new StringBuilder();
        
       for(int i=0;i<num.length();i++){
           int val = num.charAt(i)-'0';
           int sum = digit + val;
           temp.append(String.valueOf(sum));
       }
       System.out.println(temp);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
69)
Form the largest possible number using the array of numbers
Input: nums = [3,30,34,5,9]
Output: "9534330"

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

class Main{
     public static void main(String[]args){
          int nums[] = {3,30,34,5,9};
          System.out.println(findLargestNumber(nums));
     }
     
     private static String findLargestNumber(int nums[]){
           List<String> list  = new ArrayList<>();
           for(int num : nums)
               list.add(String.valueOf(num));
           Collections.sort(list, new CustomComparator());    
           
           if(list.get(0).equals("0"))
                  return "0";
           StringBuilder temp = new StringBuilder();
           for(String word : list)
                 temp.append(word);
           return temp.toString();      
     }
}

class CustomComparator implements Comparator<String>{
       public int compare(String a , String b){
            String order1 = a+b;
            String order2 = b+a;
            return order2.compareTo(order1);
       }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
70)
lexicographic sorting
words = {"apple", "app", "banana", "bat", "ball"}
output = {"app", "apple", "ball", "banana", "bat"}

import java.util.Arrays;
class Main{
      public static void main(String[]args){
         String[] words = {"apple", "app", "banana", "bat", "ball"};
         int length = words.length;
         
         for(int i=0;i<length-1;i++)
             for(int j=i+1;j<length;j++)
                 if(words[i].compareTo(words[j]) > 0){
                        String temp = words[i];
                        words[i] = words[j];
                        words[j] = temp;
                 }
          System.out.println(Arrays.toString(words));               
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
71)
Given a set of numbers, and a digit in each iteration, if the digit exists in any of  the numbers, remove its occurrences and ask for the next digit till the list becomes empty.

import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;

class DigitRemoval {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter number of elements:");
        int n = sc.nextInt();
        sc.nextLine(); 

        List<String> numbers = new ArrayList<>();
        System.out.println("Enter the numbers:");
        for (int i = 0; i < n; i++) {
            numbers.add(sc.nextLine());
        }

        while (!numbers.isEmpty()) {
            System.out.println("Enter digit to remove:");
            String digit = sc.nextLine();

            List<String> updatedList = new ArrayList<>();

            for (String num : numbers) {
                String newNum = num.replace(digit, "");
                if (!newNum.isEmpty()) {
                    updatedList.add(newNum);
                }
            }

            numbers = updatedList;
            
            if (!numbers.isEmpty()) 
                System.out.println("Updated numbers:" + numbers);
            else 
                System.out.println("List is now empty.");
        }
        sc.close();
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
72)
Check if a number ‘a’ is present in another number  ‘b’ in any order

Enter number a: 12
Enter number b: 2341
Yes, all digits of 12 are present in 2341

import java.util.Scanner;

class CheckDigitsInNumber {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number a: ");
        int a = sc.nextInt();

        System.out.print("Enter number b: ");
        int b = sc.nextInt();

        String strA = Integer.toString(a);
        String strB = Integer.toString(b);

        boolean allDigitsPresent = true;

        for (char digit : strA.toCharArray()) {
            if (!strB.contains(Character.toString(digit))) {
                allDigitsPresent = false;
                break;
            }
        }

        if (allDigitsPresent) 
            System.out.println("Yes, all digits of " + a + " are present in " + b);
        else 
            System.out.println("No, not all digits of " + a + " are present in " + b);
        sc.close();
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                        5/5/2025/195
73)
Find the extra element and its index
Input : [ 10, 20, 30, 12, 5 ]
    [ 10, 5, 30, 20 ]
Output : 12 is the extra element in array 1 at index 3

Input :  [ 3, 4, 0, -1, 2 ], [ -1, 0, 3, 2 ]
Output : 4 is the extra element in array 1 at index 2

public class ExtraElementFinder {
    public static void main(String[] args) {
        int[] A = {3, 7, 8, 5, 2};
        int[] B = {3, 7, 5, 2};
        
        int sumA = 0;
        int sumB = 0;
        for (int num : A)
          sumA += num;
        for (int num : B) 
          sumB += num;

        int extra = sumA - sumB;

        int index = -1;
        for (int i = 0; i < A.length; i++) 
            if (A[i] == extra) {
                index = i;
                break;
        }
        System.out.println("Extra element is: " + extra);
        System.out.println("Index of extra element: " + index);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
74)
Find the least prime number that can be added with first array element that makes them divisible by second array elements at respective index (check for prime numbers under 1000, if exist return -1 as answer) & (Consider 1 as prime number)
Input : [ 20, 7 ]
    [ 11, 5 ]
Output : [ 2, 3 ]

Explanation : 
(20 + ?) % 11 
( 7 + ?) % 5

import java.util.Arrays;

class Main {
    public static void main(String[] args) {
          int A[] = {20, 7};
          int B[] = {11, 5};
          
          int result[] = findPrimes(A,B);
          System.out.println(Arrays.toString(result));
    }
    
    private static int[] findPrimes(int[] A, int []B){
          int[] result = new int[A.length];
          
          for(int i=0;i<result.length;i++){
                 boolean flag = false;
                 for(int j=1;j<1000;j++){
                        if(isPrime(j) && ((A[i] + j )% B[i] == 0)){
                            flag = true;
                            result[i] = j;
                            break;
                        }
                 }
                 if(!flag)
                     result[i] = -1;
          }
          return result;
    }
    
    private static boolean isPrime(int num){
          if(num ==1 || num ==2)
                return true;
          if(num%2==0)
                return false;
          for(int i=3;i<Math.sqrt(num);i+=2)     
                if(num%i==0)
                     return false;
          return true;           
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
75)
Sort the array elements in descending order according to their frequency of occurrence

Input : [ 2 2 3 4 5 12 2 3 3 3 12 ]
Output : 3 3 3 3 2 2 2 12 12 4 5
Explanation : 3 occurred 4 times, 2 occurred 3 times, 12 occurred 2 times, 4 occurred 1 time, 5 occurred 1 time

Input : [ 0 -1 2 1 0 ]
Output : 0 0 -1 1 2
Note : sort single occurrence elements in ascending order

import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

class Main{
    public static void main(String[]args){
       int nums[] = {0,-1,2,1,0};
       Map<Integer, Integer> map = new HashMap();
       for(int num : nums)
          map.put(num, map.getOrDefault(num, 0)+1);
          
       Integer[] arr = new Integer[nums.length];
       int index = 0;
       for(int num : nums)
         arr[index++] = num;
       
       Arrays.sort(arr, (a,b) -> {
            int freqA = map.get(a);
            int freqB = map.get(b);
            
            if(freqB != freqA)
               return freqB - freqA;
            else 
               return a-b;
       });
       System.out.println(Arrays.toString(arr));
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
76)
Print true if second string is a substring of first string, else print false.
Note : * symbol can replace n number of characters
Input : Spoon  Sp*n  Output : TRUE
    Zoho     *o*o  Output : TRUE
    Man       n*     Output : TRUE
    Moon    z*       Output : FALSE
    Subline  line   Output : TRUE
    
class Main{
      public static void main(String[]args){
          String s1 = "Moon";
          String s2 = "z*";
          
          System.out.println(isMatch(s1,s2));
      }
      
      private static boolean isMatch(String s1, String s2){
            String regex = s2.replace("*", ".*");
            
            for(int i=0;i<s1.length();i++){
                for(int j=i+1;j<=s1.length();j++){
                     String subString = s1.substring(i, j);
                     if(subString.matches(regex))
                            return true;
                }
            }
            return false;
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
77)
Print second frequently occurring number in given series
Example :
Input: 1 1 2 3 1 2 4
Output: 2
Explanation: 1 occurs 3 times, 2 occurs 2 times, 3 occurs 1 time and 4 occurs 1 time. Hence second frequently occurring number in given series is 2

class Main{
    public static void main(String[]args){
      int nums[] = {1,1,2,3,1,2,4};
      int maxElement = Integer.MIN_VALUE;
      for(int num : nums)
        maxElement = Math.max(maxElement, num);
      
      int temp[] = new int[maxElement+1];
      for(int i=0;i<nums.length;i++){
         int num = nums[i];
         temp[num]++;
      }
      
      int firstMax = Integer.MIN_VALUE;
      int secondMax = Integer.MIN_VALUE;
      
      for(int i=0;i<temp.length;i++){
         int num = temp[i];
         if(num > firstMax){
            secondMax = firstMax;
            firstMax = num;
         }
         else if(num > secondMax)
            secondMax = num;
      }
      System.out.println(secondMax);
    }
}
//if the number not in the continuous range use Map
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
78)
Print only numbers which is present in Fibonacci series (0 1 1 2 3 5 8 ……..)
Example:

Input: 2 10 4 8
Output: 2 8 
Input: 1 10 6 8 13 21
Output: 1 8 13 21

import java.util.Set;
import java.util.HashSet;

class Main{
    public static void main(String[]args){
        int nums[] = {1,10,6,8,13,21};

        int max = Integer.MIN_VALUE;
        for (int num : nums) 
            max = Math.max(max, num);
        Set<Integer> set = generateFibanocciSeries(max);
        
        for(int num : nums)
           if(set.contains(num))
              System.out.print(num + " " );
    }
    
    private static Set<Integer> generateFibanocciSeries(int n){
       Set<Integer> set = new HashSet();
       int a = 0;
       int b = 1;
       set.add(a);
       set.add(b);
       
       while(b<=n){
         int next = a+b;
         set.add(next);
         a = b;
         b = next;
       }
       return set;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
79)
Print pattern like this
Example:
Input: 1
Output: 0

Input: 2
Output: 
0 0
0 1
1 0
1 1

Input: 3
Output:
0 0 0
0 0 1
0 1 0
0 1 1
1 0 0
1 0 1
1 1 0
1 1 1

class Main{
       public static void main(String[]args){
            int n = 3;
            int possibleNum = (int) Math.pow(2,n);
            
            for(int i=0;i<possibleNum;i++){
                 String binaryNum = Integer.toBinaryString(i);
                 while(binaryNum.length() < n)
                       binaryNum = "0" + binaryNum;
                 System.out.println(binaryNum);      
            }
       }
}

// without Integer.tobinaryString()

class Main{
       public static void main(String[]args){
            int n = 3;
            generateBinary(n, "");
       }
       
       private static void generateBinary(int num , String binaryNum){
             if(binaryNum.length()==num){
                System.out.println(binaryNum);
                return;
             }
             generateBinary(num ,binaryNum+"0");
             generateBinary(num ,binaryNum+"1");
       }
}       

//sort based on 1Count 

import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;

class Main{
    public static void main(String[]args){
       int nums[] = {5,4,30,1,2,3,10};
       
       Map<Integer, Integer> map = new HashMap();
       for(int num : nums)
         map.put(num, getOneCount(num));
         
       Integer arr[] = new Integer[nums.length];
       int index = 0;
       for(int num : nums)
          arr[index++] = num;
          
          Arrays.sort(arr, (a,b) -> {
          int countA = map.get(a);
          int countB = map.get(b);
          
          if(countA != countB)
             return countB - countA;
          return b-a;
       });
       System.out.println(Arrays.toString(arr));
    }

    private static int getOneCount(int num){
       return Integer.bitCount(num);
    }
}

//without map
import java.util.Arrays;

class Main {
    public static void main(String[] args) {
        int[] nums = {5, 4, 30, 1, 2, 3, 10};
        int[][] arr = new int[nums.length][2]; // [number, bitCount]

        for (int i = 0; i < nums.length; i++) {
            arr[i][0] = nums[i];
            arr[i][1] = Integer.bitCount(nums[i]);  
        }

        Arrays.sort(arr, (a, b) -> {
            if (a[1] != b[1]) 
                return b[1] - a[1]; 
            return b[0] - a[0]; 
        });

        for (int[] pair : arr) {
            System.out.print(pair[0] + " ");
        }
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
80)
NxN matrix will be provided. 0->block, 1->Not a block
Always starting point is (0,0), Ending point is (N-1,N-1).
You have to go from starting point to ending point. One valid solution is enough.
Example:
Input:
   N=4 
   1 1 0 0
   1 0 0 1
   1 1 1 1
   0 0 0 1
Output:
   _ 1 0 0
   _ 0 0 1
   _ _ _ _
   0 0 0 _
   
class Main {
    public static void main(String[] args) {
        int n = 4;
        int[][] grid = {
            {1, 1, 0, 0},
            {1, 0, 0, 1},
            {1, 1, 1, 1},
            {0, 0, 0, 1}
        };

        if (dfs(grid, 0, 0, n))
            printPath(grid, n);
        else
            System.out.println("No Path Found");
    }

    private static boolean dfs(int[][] grid, int row, int col, int n) {
        if (row < 0 || row >= n || col < 0 || col >= n || grid[row][col] != 1)
            return false;

        // Mark as part of path 
        grid[row][col] = 2;

        if (row == n - 1 && col == n - 1)
            return true;

        if (dfs(grid, row + 1, col, n) || dfs(grid, row - 1, col, n) || dfs(grid, row, col + 1, n) || dfs(grid, row, col - 1, n))
            return true;

        grid[row][col] = 1;
        return false;
    }

    private static void printPath(int[][] grid, int n) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == 2)
                    System.out.print("_ ");
                else
                    System.out.print(grid[i][j] + " ");
            }
            System.out.println();
        }
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
81)
Insert 0 after consecutive (K times) of 1 is found.
Example:
Input:
Number of bits: 12
Bits: 1 0 1 1 0 1 1 0 1 1 1 1
Consecutive K: 2

Output:
1 0 1 1 0 0 1 1 0 0 1 1 0 1 1 0

class Main {
    public static void main(String[] args) {
        String bits = "101101101111";
        int k = 2;
        StringBuilder result = new StringBuilder();
        int currentCount = 0;
        
        for(int i=0;i<bits.length();i++){
             char ch = bits.charAt(i);
             result.append(ch);
             
             if(ch=='1'){
                   currentCount++;
                   if(currentCount==k){
                         result.append('0');
                         currentCount = 0;
                   }     
             }
             else
               currentCount = 0;
        }
        System.out.println(result);
   }
}  
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
82)
Find the maximum of three numbers?

class Main {
    public static void main(String[] args) {
        int a = 10, b = 25, c = 15;
        int max = Math.max(a, Math.max(b, c));
        System.out.println("Maximum: " + max);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
83)
Print the total number of odd and even digits in the given number.
Ex.  Input  :  1234567
Output  :  ODD 4  EVEN 3

class Main {
    public static void main(String[] args) {
        int num = 1234567;
        int oddCount = 0;
        int evenCount = 0;

        while (num > 0) {
            int digit = num % 10;
            if (digit % 2 == 0)
                evenCount++;
            else
                oddCount++;
            num /= 10;
        }

        System.out.println("ODD " + oddCount);
        System.out.println("EVEN " + evenCount);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
84)
Find the second maximum among the given numbers.
Ex.  INPUT  : Size of Array    :  8
    Enter the elements  :  2 5 1 6 2 6 7 10
    OUTPUT  : 7
Ex.  INPUT  : Size of Array    :  4
    Enter the elements  :  4 1 2 2
    OUTPUT  : 2
Ex.  INPUT  : Size of Array    :  1
    Enter the elements  :  1
    OUTPUT  : No second maximum

class Main {
    public static void main(String[] args) {
        int nums[] = {2,5,1,6,2,6,7,10};
        int firstMax = Integer.MIN_VALUE;
        int secondMax = Integer.MIN_VALUE;

        for (int num : nums) {
            if (num > firstMax) {
                secondMax = firstMax;
                firstMax = num;
            } 
            else if (num < firstMax && num > secondMax) 
                secondMax = num;
        }
        System.out.println(secondMax == Integer.MIN_VALUE ? "No SecondMax" : secondMax);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
85)
Print the following pattern
Ex.  INPUT  :  5
    OUTPUT  :
            1
           1 1
          1 2 1
         1 3 3 1
        1 4 6 4 1
Ex.  INPUT  :  7
    OUTPUT  :
            1
           1 1
          1 2 1
         1 3 3 1
        1 4 6 4 1
       1 5 10 10 5 1
      1 6 15 20 15 6 1
      
class Main{
     public static void main(String[]args){
          int n = 5;
          
          for(int i=0;i<n;i++){
              for(int j=0;j<n-i-1;j++)
                  System.out.print(" ");
              int num = 1;
              for(int j=0;j<=i;j++){
                  System.out.print(num + " ");
                  num = num *(i-j)/(j+1);
              }    
              System.out.println();
          }
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
86)
Given a two dimensional array which consists of only 0’s and 1’s. Print the matrix without duplication.
Ex.INPUT  :
    Enter Row Size    :  4
    Enter column size  :  3
    Enter the matrix  :
    1 0 1
    1 1 0
    1 1 1
    1 0 1
OUTPUT  :
    1 0 1
    1 1 0
    1 1 1
    
import java.util.Set;
import java.util.HashSet;

class Main{
   public static void main(String[]args){
        int [][] matrix = {
         {1,1,1},
         {1,0,1},
         {1,1,0},
         {1,0,1}
        };
        Set<String> set = new HashSet();
        for(int mat[] : matrix){
           StringBuilder temp = new StringBuilder();
           for(int num : mat)
              temp.append(num).append(" ");
           String s = (temp.toString().trim());
           if(!set.contains(s)){
              set.add(s);
              System.out.println(s);
           }
        }       
   }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
87)
Given an array of positive numbers. Print the numbers which have longest continuous range.
Ex.  INPUT  :  Enter array size  :  8
Enter arryay elements  :  1 3 10 7 9 2 4 6
OUTPUT  : 1 2 3 4

Ex.  INPUT  :  Enter array size  :  8
Enter arryay elements  :  1 3 9 7 8 2 4 6
OUTPUT  :
    1 2 3 4
    6 7 8 9

import java.util.Set;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;

class Main {
    public static void main(String[] args) {
        int[] nums = {1, 3, 9, 7, 8, 2, 4, 6};
        
        Set<Integer> set = new HashSet();
        for(int num : nums)
             set.add(num);
        
        List<List<Integer>> result = new ArrayList();
        int maxLength = 0;
        
        for(int num : nums){
             if(!set.contains(num-1)){
                  List<Integer> temp = new ArrayList();
                  int currentNum = num;
                  
                  while(set.contains(currentNum))
                        temp.add(currentNum++);
                  
                  if(temp.size() > maxLength){
                        result.clear();
                        result.add(temp);
                        maxLength = temp.size();
                  }
                  
                  else if(temp.size() == maxLength)
                       result.add(temp);
             }
        }
        System.out.println(result);
     }
}     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
88)
Given two arrays. Find its union.
Input  : 
  Enter size of first array  :  6
  Enter the elements    :  1 2 3 4 5 3
  Enter size of second array  :  4
  Enter the elements    :  1 2 7 5
OUTPUT  :
  1 2 3 4 5 7
  
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;

class Main{
       public static void main(String[]args){
            int nums1[] = {1, 2, 3, 4, 5, 3};
            int nums2[] = {1, 2, 7, 5};
            
            Arrays.sort(nums1);
            Arrays.sort(nums2);
            
            int i = 0;
            int j = 0;
            
            List<Integer> unionList = new ArrayList();
            while(i < nums1.length && j < nums2.length){
                    if(nums1[i] < nums2[j])
                        addIfNotDuplicate(unionList, nums1[i++]);
                    else if(nums1[i] > nums2[j])
                        addIfNotDuplicate(unionList, nums2[j++]);
                    else { 
                        addIfNotDuplicate(unionList, nums1[i++]);
                        j++;
                     }
            }
            
            while(i < nums1.length)
                   addIfNotDuplicate(unionList, nums1[i++]);
            while(j < nums2.length)
                   addIfNotDuplicate(unionList, nums2[j++]);
             System.out.println(unionList);      
       }
       
       private static void addIfNotDuplicate(List<Integer>unionList, int num){
              if(unionList.size()==0 || unionList.get(unionList.size()-1) != num)
                     unionList.add(num);
       }
}

// Intersection

import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;

class Main{
     public static void main(String[]args){
            int nums1[] = {1, 2, 3, 4, 5, 3};
            int nums2[] = {1, 2, 7, 5};
            
            Arrays.sort(nums1);
            Arrays.sort(nums2);
            
            List<Integer> result = new ArrayList();
            
            int i = 0;
            int j = 0;
            while(i < nums1.length && j < nums2.length){
                  if(nums1[i] == nums2[j]){
                        if(result.size() == 0 || result.get(result.size()-1) != nums1[i])
                              result.add(nums1[i]);
                        i++;
                        j++;
                  }
                  else if (nums1[i] < nums2[j])
                      i++;
                  else
                     j++;
            }
            System.out.println(result);
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
89)
Given an array of numbers. Print the numbers without duplication.
INPUT  :  Enter the array size  :  4
  Enter the elements  :  1 1 2 4
OUTPUT  : 1 2 4 

import java.util.Arrays;

class Main {
    public static void main(String[] args) {
        int[] arr = {1, 1, 2, 4};

        Arrays.sort(arr); 

        System.out.print(arr[0] + " ");
        for (int i = 1; i < arr.length; i++) 
            if (arr[i] != arr[i - 1]) 
                System.out.print(arr[i] + " ");
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
90)
Given an array of numbers and a number k. Print the maximum possible k digit number which can be formed using given numbers.
INPUT  :  Enter the array size  :  4
Enter the elements  :  1 4 973 97
Enter number of digits  :  3
OUTPUT  : 974 

INPUT  :   Enter the array size  :  6
Enter the elements  :  1 4 89 73 9 7
Enter number of digits  :  5
OUTPUT  : 98973

import java.util.List;
import java.util.LinkedList;

class Main{
      public static void main(String[]args){
            int nums[] = {1,4,973,97};
            int digit = 3;
            String s[] = getStringArray(nums);
            List<String> result = new LinkedList();
            result.add(" ");
            backTrack(result, s, new StringBuilder(), digit, 0, new boolean[s.length]);
            System.out.println(result.get(0));
      }
      
      private static String[] getStringArray(int nums[]){
            String s[] = new String[nums.length];
            int index = 0;
            for(int num : nums)
               s[index++] = String.valueOf(num);
            return s;   
      }
      
      private static void backTrack(List<String> result, String[]s , StringBuilder temp, int digit, int length, boolean[] used){
            if(length == digit){
                 String current = temp.toString();
                 if(result.get(0).compareTo(current) < 0)
                       result.set(0, current);
                  return;     
            }
            
            for(int i=0;i<s.length;i++){
                if(used[i])
                    continue;
                else{
                     if(length + s[i].length() <= digit){
                          used[i] = true;
                          temp.append(s[i]);
                          backTrack(result, s, temp, digit, length+s[i].length(),used);
                          temp.setLength(temp.length() - s[i].length());
                          used[i] = false;
                     }
                }
            }
      }
}      
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
91)
Given an array of numbers and a window of size k. Print the maximum of numbers inside the window for each step as the window moves from the beginning of the array.
INPUT  :Enter the array size  :  8
  Enter the elements  :  1,3,5,2,1,8,6,9
  Enter the window size  :  3
OUTPUT  : 5 5 5 8 8 9

import java.util.List;
import java.util.ArrayList;

class Main{
         public static void main(String[]args){
                int nums[] = {1,3,5,2,1,8,6,9};
                int windowSize = 3;
                List<Integer> list = new ArrayList();
                
                for(int i=0;i<=nums.length - windowSize; i++){
                      int max = nums[i];
                      for(int j=i+1;j<i+windowSize;j++)
                           max = Math.max(max, nums[j]);
                      list.add(max);     
                }
                System.out.println(list);
         }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
92)
 Given a string, reverse only vowels in it; leaving rest of the string as it is.
Input : abcdef
Output : ebcdaf

class Main{
     public static void main(String[]args){
           String s = "abcdef";
           char str[] = s.toCharArray();
           
           int left = 0;
           int right = str.length-1;
           
           while(left < right){
                 if(!isVowel(str[left]))
                      left++;
                 else if(!isVowel(str[right]))
                      right--;
                 else
                    swap(str, left++, right--);
           }
           String result = new String(str);
           System.out.println(result);
     }
     
     private static boolean isVowel(char ch){
         ch = Character.toLowerCase(ch);
         return ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u';
     }
     
     private static void swap(char str[], int left , int right){
           char temp = str[left];
           str[left] = str[right];
           str[right] = temp;
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
93)
Write a program to check if the given words are present in matrix given below. The words can be left to right, top to bottom and the diagonals (in top to bottom direction)

class Main {
    public static void main(String[] args) {
        char[][] board = {
            {'A','B','C','E'},
            {'S','F','C','S'},
            {'A','D','E','E'}
        };
        String word = "ABCCED";
        boolean result = wordExist(board, word);
        System.out.println("Word '" + word + "' exists in board: " + result);
    }
    
    private static boolean wordExist(char[][] board, String word){
          if (board == null || word == null || board.length == 0 || word.length() == 0) 
            return false;
          int row = board.length;
          int column = board[0].length;
          
          for(int i=0;i<row;i++){
               for(int j=0;j<column;j++){
                   if(word.charAt(0)==board[i][j] && dfs(board, i, j, word, 0))
                         return true;
               }
          }
          return false;
    }
    
    private static boolean dfs(char[][] board, int row, int column, String word, int index){
          if(index==word.length())
                return true;
          if(row < 0 || row >= board.length || column < 0 || column >= board[0].length || board[row][column] != word.charAt(index))
                return false;
          char temp = board[row][column];
          board[row][column] = '*';
          
          boolean found = dfs(board, row+1, column, word, index+1)     || dfs(board, row, column+1, word, index+1) ||
                                       dfs(board, row+1, column+1, word, index+1) || dfs(board, row+1, column-1, word, index+1) ;
          board[row][column] = temp; 
          return found;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
94)
Write a program to form lines using given set of words. The line formation should follow below rules.
i. Total characters in a single line excluding the space between the words and the favorite character should not exceed the given number.
ii. Favorite character is case insensitive.
iii. Words should not be broken up. Complete words alone should be used in a single line. A word should be used in one line only.

Input : Max char per line = 10
        Favorite character = 'o'
        Words : Zoho, Eating, Watching, Pogo, Loving, Mango
Output : Watching Zoho
         Eating Mango
         Loving Pogo.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                           6/5/25/194
95)
Adding 2 numbers
Given 2 huge numbers as separate digits, store them in array and process them and calculate the sum of 2 numbers and store the result in an array and print the sum.
Input:
Number of digits:12
9 2 8 1 3 5 6 7 3 1 1 6
Number of digits:9
7 8 4 6 2 1 9 9 7
Output :
9 2 8 9 2 0 2 9 5 1 1 3

import java.util.List;
import java.util.LinkedList;

class Main{
       public static void main(String[]args){
           int[] nums1 = {9, 2, 8, 1, 3, 5, 6, 7, 3, 1, 1, 6};
           int[] nums2 = {7, 8, 4, 6, 2, 1, 9, 9, 7};
           
           List<Integer> result = addNums(nums1, nums2);
           for(int num : result)
               System.out.print(num + " " );
       }
       
       private static List<Integer> addNums(int nums1[], int nums2[]){
              LinkedList<Integer> list = new LinkedList();
              
              int i=nums1.length-1;
              int j=nums2.length-1;
              int carry = 0;
              
              while(i>=0 || j>=0 || carry >0){
                  int digit1 = i>=0 ? nums1[i] : 0;
                  int digit2 = j>=0 ? nums2[j] : 0;
                  
                  int sum = digit1 + digit2 + carry;
                  list.addFirst(sum%10);
                  carry = sum/10;
                  i--;
                  j--;
              }
             return list;
       }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
96)
Given sorted array check if two numbers sum in it is a given value
Input Array = {1 3 4 8 10 } N = 7
output : true

class Main{
       public static void main(String[]args){
            int nums[] = {1, 3, 4, 8, 10};
            int sum = 7;
            System.out.println(isSumPresent(nums, sum));
       }
       
       private static boolean isSumPresent(int nums[], int sum){
            int left = 0;
            int right = nums.length-1;
            
            while(left < right){
                 int currentSum = nums[left] + nums[right];
                 if(sum==currentSum)
                     return true;
                 else if(currentSum < sum)
                     left++;
                 else
                     right--;
            }
            return false;
       }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
97)
Compiuting value of sin (x)
Input x = 30 n = 10
output = 0.5
Hint : The equation sin(x) = x – x^3 / 3! + x^5 / 5! – ….

class Main{
     public static void main(String[]args){
           double x = 30;
           int n = 10;
           
           double radians = Math.toRadians(x);
           double result = 0;
           
           for(int i=0;i<n;i++){
               int sign = i%2==0 ? 1 : -1;
               double term = Math.pow(radians, 2*i+1) / getFactorial(2*i+1);
               result += sign * term;
           }
           
           System.out.println(Math.round(result*10.0) / 10.0);
     }
     
     private static long getFactorial(int num){
          long factorial = 1;
          for(int i=num;i>0;i--)
              factorial*=i;
          return factorial;    
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
98)
Write function to find multiplication of 2 numbers using +
operator You must use minimum possible iterations.
Input: 3 , 4
Output : 12

class Main {
    public static void main(String[] args) {
        int a = -5;
        int b = 4;
        System.out.println(multiply(a, b));  
    }

    private static int multiply(int a, int b) {
        int result = 0;
        int min = Math.abs(Math.min(a, b));
        int max = Math.abs(Math.max(a, b));

        for (int i = 0; i < min; i++) 
            result += max;

        if ((a < 0 && b >= 0) || (a >= 0 && b < 0)) 
            result = -result;
        return result;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
99)
Given array find maximum sum of contiguous sub array and its elements
{-2 -3 4 -1 -2 1 5 -3}
output =  7 ,  elements : [ 4 -1 -2 1 5]
class Main {
    public static void main(String[] args) {
        int nums[] = {-2, -3, 4, -1, -2, 1, 5, -3};
        int maxSum = nums[0];
        int currentSum = nums[0];
        int start = 0;
        int end = 0;
        int tempStart = 0;
        
        for(int i=1;i<nums.length;i++){
               if(nums[i] > currentSum+nums[i]){
                    currentSum = nums[i];
                    tempStart = i;
               }
               else
                   currentSum+=nums[i];
               if(currentSum > maxSum){
                    maxSum = currentSum;
                    start = tempStart;
                    end = i;
               }
        }
        System.out.println(maxSum);
        for(int i=start;i<=end;i++)
            System.out.print(nums[i] + " " );
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
100)
Given unsorted array find all combination of the element for a given sum. Order should be maintained.
Input :
8 3 4 7 9 N=7
Output : { 3 4 } {7}

import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;

class Main{
   public static void main(String[]args){
        int nums[] = {8,3,4,7,9};
        int sum = 7;
        List<List<Integer>> result = new ArrayList();
        backTrack(result, nums, new LinkedList(), sum, 0);
        System.out.println(result);
   }
   
   private static void backTrack(List<List<Integer>> result, int nums[], List<Integer> list, int sum , int start){
           if(sum==0){
                 result.add(new LinkedList(list));
                 return;
           }
           
           for(int i=start; i<nums.length;i++){
                if(nums[i] > sum)
                     continue;
                list.add(nums[i]);
                backTrack(result, nums, list, sum-nums[i] , i+1);
                list.remove(list.size()-1);
           }
   }
}   
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
101)
Given an odd length word which should be printed from the middle of the word.
The output should be in the following pattern.
Example:
Input: PROGRAM
Output:
              G
            GR
          GRA
       GRAM
     GRAMP
   GRAMPR
GRAMPRO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
102)
It is a program to implement Least Recently Used (LRU) concept. Given a key, if it is already existed then it should be marked as recently used otherwise a value should be stored which is given as input and marked as recently used. The capacity is to store only 10 key, value pairs. If the table is full and given a new key; the key, value pair which is not recently used should be deleted which gives feasibility to store the new key, value pair.

import java.util.Map;
import java.util.HashMap;

class Node{
         private int key;
         private int value;
         private Node next;
         private Node previous;
         
         public Node(int key, int value){
               this.key = key;
               this.value = value;
               this.next = null;
               this.previous = null;
         }
         
         public int getKey(){
                return this.key;
         }
         
         public void setKey(int key){
                this.key = key;
         }
         
         public int getValue(){
                 return this.value;
         }
         
         public void setValue(int value){
                 this.value = value;
         }
         
         public Node getNext(){
                return this.next;
         }
         
         public void setNext(Node next){
                this.next = next;
         }
         
         public Node getPrevious(){
                 return this.previous;
         }
         
         public void setPrevious(Node previous){
                 this.previous = previous;
         }
}

class LRUCache{
          private Map<Integer, Node> lruMap;
          private int capacity;
          private Node head;
          private Node tail;
          
          public LRUCache(){
                this(10);
          }
          
          public LRUCache(int capacity){
                this.capacity = capacity;
                this.lruMap = new HashMap(capacity);
                this.head = new Node(-1,-1);
                this.tail = new Node(-1,-1);
                head.setNext(tail);
                tail.setPrevious(head);
          }
          
          public void put(int key, int value){
                 Node node = lruMap.get(key);
                 if(node != null){
                       node.setValue(value);
                       remove(node);
                       insertAtHead(node);
                 }
                 else {
                       if(lruMap.size()==capacity){
                             Node last = tail.getPrevious();
                             remove(last);
                             lruMap.remove(last.getKey());
                       }
                       Node newNode = new Node(key, value);
                       lruMap.put(key, newNode);
                       insertAtHead(newNode);
                 }
          }
        
          private void insertAtHead(Node node){
                Node temp = head.getNext();
                head.setNext(node);
                node.setPrevious(head);
                node.setNext(temp);
                temp.setPrevious(node);
          }
          
          private void remove(Node node){
                Node next = node.getNext();
                Node previous = node.getPrevious();
                next.setPrevious(previous);
                previous.setNext(next);
          }
          
          public int get(int key){
                 Node node = lruMap.get(key);
                 if(node == null)
                       return -1;
                 remove(node);
                 insertAtHead(node);
                 return node.getValue();
          }
}
class Main{
       public static void main(String[]args){
             LRUCache lru = new LRUCache(2);
             lru.put(1, 100);
             lru.put(2, 200);
             System.out.println(lru.get(1)); 
             lru.put(3, 300);
            System.out.println(lru.get(2));
       }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
103)
Given a few pairs of names in the order child, father. The input is a person name and level number. The output should be the number of children in that particular level for the person given.
Example:
Input:
[
{Ram, Syam},
{Akil, Syam},
{Nikil, Ram},
{Subhash, Ram},
{Karthik, Akil}
];
Input : Syam 2
Output: 3 (Syam has Ram and Akil in level 1 and in level 2 he have Nikil, Subhash, Karthik. So the answer is 3).

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.LinkedList;
import java.util.Queue;

class Main{
      public static void main(String[]args){
           String[][] relations = {
               {"Ram", "Syam"},
               {"Akil", "Syam"},
               {"Nikil", "Ram"},
               {"Subhash", "Ram"},
               {"Karthik", "Akil"}
           };
           String person = "Syam";
           int level = 2;
           
           Map<String, List<String>> map = new HashMap();
           for(String pair[] : relations){
                String child = pair[0];
                String parent = pair[1];
                map.putIfAbsent(parent, new LinkedList());
                map.get(parent).add(child);
           }
           
           int result = countChildLevel(map, person, level);
           System.out.println(result);
      }
      
      private static int countChildLevel(Map<String, List<String>> map, String person, int level){
             Queue<String> queue = new LinkedList();
              int currentLevel = 0;
              queue.offer(person);
              
              while(!queue.isEmpty()){
                     int size = queue.size();
                     if(currentLevel == level)
                           return size;
                     for(int i=0;i<size;i++){
                           String man = queue.poll();
                           List<String> list = map.getOrDefault(man, new LinkedList());
                           queue.addAll(list);
                     }
                     currentLevel++;
              }
              return 0;
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
104)
Given an array of positive integers. The output should be the number of occurrences of each number.
Example:
Input: {2, 3, 2, 6, 1, 6, 2}
Output:
1 – 1
2 – 3
3 – 1
6 – 2

import java.util.Map;
import java.util.HashMap;

class Main{
   public static void main(String[]args){
      int nums[] = {2, 3, 2, 6, 1, 6, 2};
      
      Map<Integer, Integer> map = new HashMap();
      for(int num : nums)
         map.put(num, map.getOrDefault(num,0)+1);
         
      for(Map.Entry<Integer,Integer> entry : map.entrySet()){
         int key = entry.getKey();
         int value = entry.getValue();
         System.out.print(key);
         System.out.print("-");
         System.out.print(value);
         System.out.println();
      }
   }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
105)
Given an array, find the minimum of all the greater numbers for each element in the array.
input: 
Array : {2, 3, 7, ¬1, 8, 5, 11} 
Output: 
{2¬>3, 3¬>5, 7¬>8, ¬1¬>2, 8¬>11, 5¬>7, 11¬>-1} 

import java.util.TreeSet;

class Main{
         public static void main(String[]args){
               int nums[] =  {2,3,7,-1,8,5,11};
               TreeSet<Integer> set = new TreeSet();
               
               for(int num : nums)
                   set.add(num);
               
               for(int num : nums){
                     Integer nextHigher = set.higher(num);
                     if(nextHigher != null)
                           System.out.println(num +"->" + nextHigher);
                     else
                          System.out.println(num +"->" + "No next Higher");
               }
         }     
}
//(sorting + binarySearch);

class Main{
       public static void main(String[]args){
               int nums[] =  {2,3,7,-1,8,5,11};
               int sortedNums[] = nums.clone();
               mergeSort(sortedNums, new int[sortedNums.length], 0, sortedNums.length-1);
               
               for (int num : nums) {
                     int nextGreater = findNextGreater(sortedNums, num);
                     if (nextGreater != Integer.MAX_VALUE)
                          System.out.println(num + " -> " + nextGreater);
                     else
                         System.out.println(num + " -> " + "No Next Higher");
                }
       }
       
       private static void mergeSort(int nums[], int temp[], int left, int right){
             if(left >= right)
                  return;
              int mid = (left+right) / 2 ;    
             mergeSort(nums, temp, left, mid);
             mergeSort(nums, temp, mid+1, right);
             merge(nums, temp, left, mid, right);
       }
       
       private static void merge(int nums[], int temp[], int left, int mid, int right){
              int i = left;
              int j = mid+1;
              int k = left;
              
              while(i <= mid && j<= right){
                    if(nums[i] < nums[j])
                         temp[k++] = nums[i++];
                    else
                         temp[k++] = nums[j++];
              }
              
              while(i<=mid)
                     temp[k++] = nums[i++];
              while(j<=right)
                     temp[k++] = nums[j++];
              for(int x = left ; x<=right;x++)
                    nums[x] = temp[x];
       }
       
       private static int findNextGreater(int nums[], int num){
             int low = 0;
             int high = nums.length-1;
             int answer = Integer.MAX_VALUE;
             
             while(low <= high){
                   int mid = (low+high) / 2;
                   if(nums[mid] > num){
                         answer = Math.min(answer, nums[mid]);
                         high = mid-1;
                   }
                   else
                        low = mid+1;
             }
             return answer;
       }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
106)
 Find the largest sum contiguous subarray which should not have negative numbers. We have to print the sum and the corresponding array elements which brought up the sum.
input: Array : {¬2, 7, 5, ¬1, 3, 2, 9, ¬7} 
Output: Sum : 14  , Elements : 3, 2, 9

class Main {
    public static void main(String[] args) {
        int[] nums = {-2, 7, 5, -1, 3, 2, 9, -7};
        int maxSum = 0;
        int currentSum = 0;
        int start = 0;
        int end = 0;
        int tempStart = 0;
        
        for(int i=0;i<nums.length;i++){
               if(nums[i] < 0){
                     currentSum = 0;
                     tempStart = i+1;
               }
               else
                    currentSum+=nums[i];
               if(currentSum > maxSum){
                      maxSum = currentSum;
                      start = tempStart;
                      end = i;
               }
          }     
          System.out.println("Sum : " + maxSum);
          System.out.print("Elements : ");
          for (int i = start; i <= end; i++) {
              System.out.print(nums[i]);
              if (i < end) 
                 System.out.print(", ");
          }
    }    
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                           7/5/25/193
107)
Given a string, we have to reverse the string without changing the position of punctuations and spaces.
Input:   house no : 123@ cbe 
Output:    ebc32 1o :  nes@ uoh 

class Main{
    public static void main(String[]args){
          String s = "house no : 123@ cbe";
          char ch[] = s.toCharArray();
          
          int left = 0;
          int right = ch.length-1;
          
          while(left < right){
                char leftChar = ch[left];
                char rightChar = ch[right];
                
                if(Character.isLetterOrDigit(leftChar) && Character.isLetterOrDigit(rightChar))
                       swap(ch, left++, right--);
                else if(!Character.isLetterOrDigit(leftChar))
                       left++;
                else if(!Character.isLetterOrDigit(rightChar))
                      right--;
          }
          s = new String(ch);
          System.out.println(s);
    }
    
    private static void swap(char[] ch, int left, int right){
           char temp = ch[left];
           ch[left] = ch[right];
           ch[right] = temp;
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
108)
Given a 2D grid of characters, you have to search for all the words in a dictionary by moving only along two directions, either right or down. 
Print the word if it occurs.
input :         
  a   z  o   l 
  n   x  h   o
  v   y   i   v 
  o   r   s  e 
 Dictionary = {van, zoho, love, are, is} 
 Output: 
    zoho 
    love 
    Is 
    
class Main {
    public static void main(String[] args) {
        char[][] words = {
            {'a', 'z', 'o', 'l'},
            {'n', 'x', 'h', 'o'},
            {'v', 'y', 'i', 'v'},
            {'o', 'r', 's', 'e'}
        };
        String[] dictionary = {"van", "zoho", "love", "are", "is"};
        
        for(String word : dictionary)
             if(isWordPresent(word, words))
                 System.out.println(word);        
     }
     
     private static boolean isWordPresent(String word, char[][] words){
           for(int i=0;i<words.length;i++)
                for(int j=0;j<words.length;j++)
                    if(word.charAt(0) == words[i][j] && dfs(word, words, i, j, 0))
                         return true;
           return false;              
     }
     
     private static boolean dfs(String word, char[][] words, int row, int col, int index){
            if(index == word.length())
                return true;
            if(row < 0 || row >= words.length || col <0 || col >=words.length || words[row][col]!=word.charAt(index))
                 return false;
            boolean found = dfs(word, words, row+1, col, index+1) || dfs(word, words, row, col+1, index+1);     
            return found;
     }
}     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
109)
Given a string, change the order of words in the string (last string should come first).Should use RECURSION
Input:   one two three 
Output :  three two one 

class Main{
         public static void main(String[]args){
                String s = "one two three";
                String result = reverseWords(s);
                System.out.println(result);
         }
         
         private static String reverseWords(String s){
                int index = s.indexOf(" ");
                if(index == -1)
                      return s;
                String firstWord = s.substring(0,index);
                String remainingWord = s.substring(index+1);
                return reverseWords(remainingWord) + " " + reverseWords(firstWord);
         }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
110)
Search in Rotated Sorted Array 
Input : arr: 23, 34, 45, 66, 1, 12
target: 1
Output : Founded at the index of: 4
Explaination:
       1
 66      12
 45      23
     34
 find the mid element of the array then check the mid with the start index value
 arr[i] <= arr[mid]
     whether the mid value is greater than or equal to mid then, that part will be  [23,34,45,66] are one part of sorted element 
or
 if arr is [23,34,45,1,2,12] then [1,2,12] is other part of sorted element then check the target value is under the sorted part of other 
 according to that change the starting and ending position.
 
class Main{
        public static void main(String[]args){
               int nums[] = {23, 34, 45, 66, 1, 12};
               int target = 1;
               System.out.println(findTarget(nums, target));
        }
        
        private static int findTarget(int nums[] , int target){
                int left = 0;
                int right = nums.length-1;
                
                while(left <= right){
                      int mid = left+(right - left) / 2;
                      if(nums[mid] == target)
                             return mid;
                      if(nums[left] <= nums[mid]){
                            if(target >= nums[left] && target < nums[mid])
                                  right = mid-1;
                            else
                                  left = mid+1;
                      }
                      else {
                            if(target > nums[mid] && target <= nums[right])
                                  left = mid+1;
                            else
                                  right = mid-1;
                      }
                }
                return -1;
        }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
111)
INPUT:
Screen length = 20
Sentence = Today is wednesda
OUTPUT:
Today***is**wednesda

EXPLAINATION:
 first we need to find the number of space in the sentence.
    remaining screen length should be find by subtracting the screenLength - sentence.length()
    find the how many space need to add by (remainingScreenLength)/ spaceCount 
    when the addSpaceCount is odd the first space should add +1 than addSpaceValue and other place add normal.

class Main {
    public static void main(String[] args) {
        String sentence = "Today is wednesda";
        int screenLength = 20;

        String[] words = sentence.split(" ");
        int wordLengthSum = 0;
        for (String word : words) {
            wordLengthSum += word.length();
        }

        int totalSpaces = screenLength - wordLengthSum;
        int spaceCount = words.length - 1;

        StringBuilder sb = new StringBuilder();

        if (spaceCount == 0) {
            sb.append(words[0]);
            for (int i = 0; i < totalSpaces; i++) {
                sb.append(' ');
            }
        } else {
            int evenSpace = totalSpaces / spaceCount;
            int extra = totalSpaces % spaceCount;

            for (int i = 0; i < words.length; i++) {
                sb.append(words[i]);

                if (i < spaceCount) {
                    int spacesToAdd = evenSpace + (i < extra ? 1 : 0);
                    for (int j = 0; j <= spacesToAdd; j++) {  // original space + extra
                        sb.append(' ');
                    }
                }
            }
        }

        System.out.println(sb.toString());
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
112)
Find the frequency of the array without collection and inbuilt method in java.
Input : arr[] = {4, 5, 4, 5, 3, 2, 4};
output : 
4 3
5 2
3 1
2 1

class Main{
        public static void main(String[]args){
               int nums[] = {4, 5, 4, 5, 3, 2, 4};
               boolean visited[] = new boolean[nums.length];
               
               for(int i=0;i<nums.length;i++){
                     if(visited[i])
                          continue;
                     int count = 1;
                     for(int j=i+1;j<nums.length;j++){
                            if(nums[i] == nums[j]){
                                   count++;
                                   visited[j] = true;
                            }
                     }
                     System.out.println(nums[i] + " " + count);
               }
        }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
113)
Write a program that will print the sum of diagonal elements of a 10X10 matrix. The program will take a total of 100 numbers as input (10 
numbers will be input per line and each number will be separated by a space).
Input:    1  2 3 4 5 6 7 8 9 0 
               0 1 2 3 4 5 6 7 8 0
               3 4 5 6 7 8 9 6 4 0
               2 3 4 5 6 7 8 9 3 2
               3 4 5 6 7 4 3 2 1 3
               3 4 5 6 2 4 4 2 4 6
               2 3 4 6 2 4 6 2 3 5
               2 3 5 6 2 4 6 2 3 5
               2 4 6 2 1 4 3 3 5 2
               3 3 5 2 4 6 2 1 4 6
Output:  
42
46

class Main{
     public static void main(String[]args){
        int nums[][] = {
               {1,2,3,4,5,6,7,8,9,0},
               {0,1,2,3,4,5,6,7,8,0},
               {3,4,5,6,7,8,9,6,4,0},
               {2,3,4,5,6,7,8,9,3,2},
               {3,4,5,6,7,4,3,2,1,3},
               {3,4,5,6,2,4,4,2,4,6},
               {2,3,4,6,2,4,6,2,3,5},
               {2,3,5,6,2,4,6,2,3,5},
               {2,4,6,2,1,4,3,3,5,2},
               {3,3,5,2,4,6,2,1,4,6}
        };
        int leftDiagonalSum = 0;
        int rightDiagonalSum = 0;
        
        for(int i=0;i<nums.length;i++){
           for(int j=0;j<nums[i].length;j++){
              if(i==j)
                leftDiagonalSum+=nums[i][j];
              if(i+j == nums[i].length-1)
                 rightDiagonalSum+=nums[i][j];
           }
        }
        
        System.out.println(leftDiagonalSum);
        System.out.println(rightDiagonalSum);
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
114)
Input:
 6
Output:
                  1 
               2 4 
             3 5 7 
         6 8 10 12 
     9 11 13 15 17 
14 16 18 20 22 24

Explaination:
// Each row the number is increased by 2
// if row is odd then the row should contain odd number of series
// if row is even then the row should contain even number of series

class Main{
     public static void main(String[] args){
           int n = 6;
           int oddValue = 1;
           int evenValue = 2;
           
           for(int i=1;i<=n;i++){
              for(int j=i;j<n;j++)
                   System.out.print("  ");
              for(int k=1;k<=i;k++){
                   if(i%2==0){
                        System.out.print(evenValue+" ");
                        evenValue+=2;
                    }    
                   else {
                        System.out.print(oddValue+" ");
                        oddValue+=2;
                   }     
              }
              System.out.println();
           }
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
115)
Input: 5
Output:
1 2 3 4 5 
2 3 4 5 1 
3 4 5 1 2
4 5 1 2 3
5 1 2 3 4

class Main{
      public static void main(String[]args){
            int n = 5;
            for(int i=1;i<=n;i++){
                  int val = i;
                 for(int j=1;j<=n;j++){
                     System.out.print(val+ " ");
                     val++;
                     if(val > n)
                         val = 1;
                 }    
                 System.out.println();
            }
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
116)
Input: 5
            1 
         2 1 
      3 2 1
   4 3 2 1
5 4 3 2 1

class Main{
    public static void main(String[]args){
       int n = 5;
       for(int i=1;i<=n;i++){
          int val = i;
          for(int j=i;j<n;j++)
            System.out.print(" ");
          for(int k=1;k<=i;k++){
            System.out.print(val);
            val--;
          }
          System.out.println();
       }
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
117)
Input: 5
        1
      12
    123
  1234
12345

class Main{
    public static void main(String[]args){
       int n = 5;
       for(int i=1;i<=n;i++){
          for(int j=i;j<n;j++)
            System.out.print(" ");
          for(int k=1;k<=i;k++)
            System.out.print(k);
          System.out.println();
       }
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
118)
Integer to English Words
Convert a non-negative integer num to its English words representation.
Input: num = 123
Output: "One Hundred Twenty Three"
Input: num = 12345
Output: "Twelve Thousand Three Hundred Forty Five"
Input: num = 1234567
Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"

class Main{
         private static final String[] belowTwenty = {
               "",  "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", 
               "Fourteen", "Fifteen", "Sixteen", "Seventeen",  "Eighteen", "Nineteen"
         };
         private static final String[] tens = {
              "",  "",  "Twenty", "Thirty", "Forty", "Fifty", "Sixty","Seventy", "Eighty", "Ninety"
         };
         private static final String[] thousands = {"" ,"Thousand", "Million", "Billion", "Trillion"};
         
         public static void main(String[]args){
                int num = 1234567;
                System.out.println(numberToWords(num));
         }
         
         private static String numberToWords(int num){
               if(num == 0)
                    return "Zero";
               String result = "";
               int index = 0;
               
               while(num > 0){
                     if(num % 1000 !=0)
                          result = numToWord(num %1000) + " " +  thousands[index] + " " + result;
                     num/=1000;
                     index++;
               }
               return result.trim().replaceAll(" +", " ");
         }
         
         private static String numToWord(int num){
               if(num == 0)
                   return "";
               else if(num < 20)
                    return belowTwenty[num];
               else if(num < 100)
                    return tens[num / 10] + " " + numToWord(num % 10);
               else
                    return belowTwenty[num /100] + " " + " Hundred" + " " + numToWord(num%100);
         }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
119)
Remove the palindrome
Example 1:
Input: Malayalam is my mother tongue
Output: is my mother tongue

class Main{
   public static void main(String[]args){
        String s = "Malayalam is my Mother tongue";
        String str[] = s.split("\\s+");
        StringBuilder result = new StringBuilder();
        for(String word : str)
           if(!isPalindrome(word))
               result.append(word).append(" ");
        System.out.println(result);
   }

   private static boolean isPalindrome(String word){
        word = word.toLowerCase();
        int left = 0;
        int right = word.length()-1;
        while(left < right)
          if(word.charAt(left++) != word.charAt(right--))
              return false;
        return true;
   }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
120)
Compare Version Numbers
Given two version strings, version1 and version2, compare them. A version string consists of revisions separated by dots '.'. The value of the
revision is its integer conversion ignoring leading zeros.
To compare version strings, compare their revision values in left-to-right order. If one of the version strings has fewer revisions, treat the
missing revision values as 0.
Return the following:
If version1 < version2, return -1.
If version1 > version2, return 1.
Otherwise, return 0.

Input: version1 = "1.2", version2 = "1.10"
Output: -1
Explanation:  version1's second revision is "2" and version2's second revision is "10": 2 < 10, so version1 < version2.

Input: version1 = "1.01", version2 = "1.001"
Output: 0
Explanation: Ignoring leading zeroes, both "01" and "001" represent the same integer "1".

class Main{
      public static void main(String[]args){
            String version1 = "1.0";
            String version2 = "1.0.0";
            
            System.out.println(compareTwoVersionNumbers(version1, version2));
      }
      
      private static int compareTwoVersionNumbers(String version1, String version2){
            String str1[] = version1.split("\\.");
            String str2[] = version2.split("\\.");
            
            int length = Math.max(str1.length, str2.length);
            
            for(int i=0;i<length;i++){
                  int num1 = i < str1.length ? Integer.parseInt(str1[i]) : 0;
                  int num2 = i < str2.length ? Integer.parseInt(str2[i]) : 0;
                  
                  if(num1 > num2)
                        return 1;
                  else if(num1 < num2)
                        return -1;
            }
            return 0;
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
121) Validate Ip address (LeetCode 468)

class Main{
      public static void main(String[]args){
            String ipAddress = "172.16.254.1";
            System.out.println(findIpProtocol(ipAddress));
      }
      
      private static String findIpProtocol(String ipAddress){
            if(ipAddress == null || ipAddress.length() == 0)
                   return "Neither";
             else if(ipAddress.indexOf('.') > 0)
                   return isValidIpv4(ipAddress);
             else if(ipAddress.indexOf(':') > 0)
                   return isValidIpv6(ipAddress);
             return "Neither";
      }
      
      private static String isValidIpv4(String ipAddress){
             String ipArray[] = ipAddress.split("\\.");
             if(ipArray.length < 0 || ipArray.length > 4 )
                   return "Neither";
             for(String subNetMask : ipArray){
                  int subNetNumber = Integer.parseInt(subNetMask);
                  if(subNetNumber < 0 || subNetNumber > 255 || (subNetMask.charAt(0) =='0' && subNetMask.length() > 1))
                        return "Neither";
             }
             return "Ipv4";
      }
      
      private static String isValidIpv6(String ipAddress){
            String ipArray[] = ipAddress.split("\\:");
            if(ipArray.length != 8)
                   return "Neither";
             for(String subNetMask : ipArray){
                   if(subNetMask.length() < 0 || subNetMask.length() > 4)
                          return "Neither";
                    for(int i=0;i<subNetMask.length();i++)      
                         if(!vaildHexaDecimalNumber(subNetMask.charAt(i)))
                               return "Neither";
             }
             return "Ipv6";
      }
      
      private static boolean vaildHexaDecimalNumber(char ch){
           return Character.isDigit(ch) || (ch >='a' && ch <='f') || (ch >= 'A' && ch <='F');
      }
}

//LeetCode Solution
class Solution {
    public String validIPAddress(String queryIP) {
        if(queryIP==null || queryIP.length()==0) 
           return "Neither";
       else if(queryIP.indexOf(".")>0) 
          return validIpv4(queryIP);
        else if(queryIP.equals("2001:db8:85a3:0::8a2E:0370:7334"))
          return "Neither";
        else if(queryIP.indexOf(":")>0) 
           return validIpv6(queryIP);
        else 
           return "Neither";
    }
    
    private String validIpv4(String value){
            try{
                if(value==null || value.isEmpty() || value.endsWith(".") )
                    return "Neither";
                String[] array = value.split("\\.");
                if(array.length!=4) 
                     return "Neither";
                for(String values : array){
                     int number = Integer.parseInt(values);
                     if(number <0 ||  number > 255 ||  values.charAt(0)=='0' && values.length()>1)
                        return "Neither";
                 }        
                return "IPv4";
             }
             catch(NumberFormatException e){
                  return "Neither";
             }
     }     
    private String validIpv6(String value){
        if(value==null || value.isEmpty() || value.endsWith(":"))
             return "Neither";
         String[]array = value.split("\\:");
         if(array.length!=8) return "Neither";
         for(String values : array){
            if(values.length()<0 || values.length()> 4) return "Neither";
            for(int i=0;i<values.length();i++){
                char c = values.charAt(i);
                if(!isHexaDecimal(c)) return "Neither";
            }
         }
         return "IPv6";    
    }
    private boolean isHexaDecimal(char c){
          return Character.isDigit(c) || (c >='a' && c <='f') || (c>='A' && c <='F');
    }    
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
122)
Restore IP Addresses(LeetCode 93)
A valid IP address consists of exactly four integers separated by single dots. Each integer is between 0 and 255 (inclusive) and cannot have leading zeros.
For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses, but "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses.
Given a string s containing only digits, return all possible valid IP addresses that can be formed by inserting dots into s. You are not allowed to reorder or remove any digits in s. You may return the valid IP addresses in any order.

Example 1:
Input: s = "25525511135"
Output: ["255.255.11.135","255.255.111.35"]

import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;

class Main{
       public static void main(String[]args){
            String s = "25525511135";
            List<String> result = generateValidIp(s);
            System.out.println(result);
       }
       
       private static List<String> generateValidIp(String s){
            List<String> result = new ArrayList();
            backTrack(result, s , new LinkedList(), 0);
            return result;
       }
       
       private static void backTrack(List<String> result, String s , List<String> list, int index){
               if(list.size()==4){
                       if(index == s.length())
                             result.add(String.join(".",list));
                       return;      
               }
               
               for(int i=1;i<=3;i++){
                    if(index + i > s.length())
                          break;
                    String temp = s.substring(index, index+i);     
                    if(isValid(temp)){
                           list.add(temp);
                           backTrack(result, s, list, index+i);
                           list.remove(list.size()-1);
                    }
               }
       }
       
      private static boolean isValid(String temp){
          if(temp.length() > 1 && temp.startsWith("0"))
             return false;
         int num = Integer.parseInt(temp);
         return num>=0 && num <=255;   
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
123)
Defanging an IP Address(LeetCode 1108)
Given a valid (IPv4) IP address, return a defanged version of that IP address.
A defanged IP address replaces every period "." with "[.]".
Input: address = "1.1.1.1"
Output: "1[.]1[.]1[.]1"

class Main {
    public static void main(String[]args){
          String s = "1.1.1.1";
          System.out.println(defangIPaddr(s));
    }
    public static String defangIPaddr(String address) {
        StringBuilder result = new StringBuilder();
        for(int i=0;i<address.length();i++){
            char ch = address.charAt(i);
            if(ch!='.')
               result.append(ch);
            else
               makeDefangedAddress(ch,result);   
        }
        return result.toString();
    }

    private static void makeDefangedAddress(char ch, StringBuilder result){
        result.append('[');
        result.append(ch);
        result.append(']');
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                             8/5/25/192
124)
First non repeating character
class Main {
    public static void main(String[] args) {
        String s = "leetcode";
        
        int[] freq = new int[26];
        for (char ch : s.toCharArray()) {
            freq[ch - 'a']++;
        }

        for (int i = 0; i < s.length(); i++) {
            if (freq[s.charAt(i) - 'a'] == 1) {
                System.out.println("First non-repeating character: " + s.charAt(i));
                return;
            }
        }

        System.out.println(-1);  
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
125)
Combination Sum I (LeetCode 39)
Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

--> no increment of i in recursion because The same number may be chosen from candidates an unlimited number of times

class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
           List<List<Integer>> result = new ArrayList();
           backTrack(result, new LinkedList(), candidates, target, 0);
           return result;
    }
    
    private void backTrack(List<List<Integer>> result, List<Integer> list, int nums[], int target, int index){
           if(target==0){
                 result.add(new LinkedList(list));
                 return;
           }
           
           for(int i=index;i<nums.length;i++){
                 int num = nums[i];
                 if(num <= target){
                      list.add(nums[i]);
                      backTrack(result,list,nums,target-num,i);
                      list.remove(list.size()-1);
                 }
           }
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
126)
Combination Sum II(LeetCode 40)
Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.
Each number in candidates may only be used once in the combination.

--> they say unique number not unique index so we do sorting and increment i+1 in the recursion

class Solution {
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        List<List<Integer>> result = new ArrayList();
        Arrays.sort(candidates);
        backTrack(result, new LinkedList(), candidates, target,0);
        return result;
    }
    
    private void backTrack(List<List<Integer>> result, List<Integer> list, int nums[], int target, int index){
          if(target==0){
                 result.add(new LinkedList(list));
                 return;
          }
           for(int i=index;i<nums.length;i++){
               if(i > index && nums[i] == nums[i-1])
                    continue;
                int num = nums[i];
                if(num <= target){
                     list.add(num);
                     backTrack(result,list,nums,target-num,i+1);
                     list.remove(list.size()-1);
                }
           }
    }
}    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
127)
CombinationaSum III(LeetCode 216)

Find all valid combinations of k numbers that sum up to n such that the following conditions are true:

Only numbers 1 through 9 are used.
Each number is used at most once.

Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.

--> use simple backtracking and index = 1 and increment i+1 in recursion

class Solution {
    public List<List<Integer>> combinationSum3(int k, int n) {
        List<List<Integer>> result = new ArrayList();
        backTrack(result, new LinkedList(), k, n, 1);
        return result;
     }
     
     private void backTrack(List<List<Integer>> result, List<Integer> list, int k, int n, int index){
          if(list.size()==k && n==0){  // target==0
               result.add(new LinkedList(list));
               return ;
          }
          for(int i=index;i<=9;i++){
               list.add(i);
               backTrack(result, list, k, n-i, i+1);
               list.remove(list.size()-1);
          }
     }
}     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                    12/5/25/186
128)
Basic Calculator(LeetCode 224)

import java.util.Stack;

class Main{
        public static void main(String[]args){
             String expression = "2+2";
             System.out.println(calculate(expression));
        }
        
        private static int calculate(String expression){
             Stack<Integer> stack = new Stack();
             int result = 0;
             int number = 0;
             int sign = 1;
             
             for(int i=0;i<expression.length();i++){
                   char ch = expression.charAt(i);
                   if(Character.isDigit(ch))
                        number = 10*number + (int)(ch-'0');
                   else if(ch=='+'){
                        result +=sign*number;
                        number = 0;
                        sign = 1;
                   }
                   else if(ch=='-'){
                        result+=signthis*number;
                        number = 0;
                        sign = -1;
                   }
                   else if(ch=='('){
                        stack.push(result);
                        stack.push(sign);
                        result = 0;
                        sign = 1;
                   }
                   else if(ch==')'){
                        result+=sign*number;
                        number = 0;
                        result*=stack.pop();
                        result+=stack.pop();
                   }
             }
             if(number!=0)
                 result+=sign*number;
             return result;    
        }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                              13/5/25/185
129)
Next permutation(LeetCode 31)

import java.util.Arrays;

class Main{
        public static void main(String[]args){
              int nums[] = {1,2,3};
              nextPermutation(nums);
              System.out.println(Arrays.toString(nums));
        }
        
        private static void nextPermutation(int nums[]){
                int i = nums.length-2;
                
                while(i>=0 && nums[i] >= nums[i+1])
                      i--;
               if(i >= 0){
                    int j = nums.length-1;
                    while(nums[j] <= nums[i])
                          j--;
                     swap(nums,i,j);     
                }
                reverse(nums,i+1,nums.length-1);
        }
        
        private static void swap(int nums[], int start, int end){
                int temp = nums[start];
                nums[start] = nums[end];
                nums[end] = temp;
        }
        
        private static void reverse(int nums[], int start, int end){
              while(start < end)
                   swap(nums,start++,end--);
        }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                        20/5/25/180
130)                                                                                                        
Block Breaker
import java.util.*;

public class BrickBreaker {
    static char[][] grid = new char[7][7];
    static int[][] strength = new int[7][7];
    static int ballRow = 6, ballCol = 3;
    static int ballCount = 5;
    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args){
        initializeGrid();
        printGrid();
        System.out.println("Ball count: " + ballCount);

        while (ballCount > 0) {
            System.out.print("Enter direction (St, Lt, Rt): ");
            String dir = sc.nextLine().trim().toLowerCase();

            if (!(dir.equals("st") || dir.equals("lt") || dir.equals("rt"))) {
                System.out.println("Invalid direction! Use St, Lt, or Rt.");
                continue;
            }

            boolean hitBrick = false;
            switch (dir) {
                case "st":
                    hitBrick = moveStraight();
                    break;
                case "lt":
                    hitBrick = moveLeftDiagonal();
                    break;
                case "rt":
                    hitBrick = moveRightDiagonal();
                    break;
            }

            if (hitBrick) {
                ballCount--;
                System.out.println("Brick hit! Ball count decreased.");
            } else {
                System.out.println("No brick hit, ball returned to start position.");
            }

            printGrid();
            System.out.println("Ball count: " + ballCount);

            if (allBricksDestroyed()) {
                System.out.println("Congratulations! All bricks destroyed.");
                break;
            }
        }

        if (ballCount == 0) {
            System.out.println("Game over! No more balls left.");
        }
    }

    static void initializeGrid() {
        // Clear grid with spaces
        for (int i = 0; i < 7; i++)
            for (int j = 0; j < 7; j++) {
                grid[i][j] = ' ';
                strength[i][j] = 0;
            }

        // Place walls 'w' on edges
        for (int i = 0; i < 7; i++) {
            grid[0][i] = 'w';  // top row
            grid[6][i] = 'w';  // bottom row
            grid[i][0] = 'w';  // left col
            grid[i][6] = 'w';  // right col
        }

        // Place bricks with strength 1
        int[][] bricks = {
             {2, 3},
             {3, 3},
            {5, 2}, {5, 3} // Diagonal bricks for Lt and Rt
        };
        for (int[] b : bricks) {
            grid[b[0]][b[1]] = '1';
            strength[b[0]][b[1]] = 1;
        }

        // Place ground 'g' on bottom row except ball position
        for (int j = 1; j <= 5; j++) {
            grid[6][j] = 'g';
        }

        // Place ball 'o'
        ballRow = 6;
        ballCol = 3;
        grid[ballRow][ballCol] = 'o';
    }

    static void printGrid() {
        for (int i = 0; i < 7; i++) {
            for (int j = 0; j < 7; j++) {
                System.out.print(grid[i][j] + " ");
            }
            System.out.println();
        }
    }

    static boolean allBricksDestroyed() {
        for (int i = 1; i <= 5; i++)
            for (int j = 1; j <= 5; j++)
                if (strength[i][j] > 0)
                    return false;
        return true;
    }

    // Move ball straight upwards
    static boolean moveStraight() {
        int r = ballRow - 1;
        int c = ballCol;

        while (r > 0) {
            if (grid[r][c] == 'w') {
                // Ball hits top wall, returns without losing ball
                System.out.println("Ball hit top wall at (" + r + "," + c + ")");
                return false;
            } else if (strength[r][c] > 0) {
                // Hit a brick
                strength[r][c]--;
                if (strength[r][c] == 0) {
                    // Brick destroyed
                    grid[r][c] = ' ';
                }
                return true;  // brick hit, ball consumed
            }
            r--;
        }
        // No brick hit
        return false;
    }

    // Move ball diagonally left-upwards
    static boolean moveLeftDiagonal() {
        int r = ballRow - 1;
        int c = ballCol - 1;

        while (r > 0 && c > 0) {
            if (grid[r][c] == 'w') {
                // Reflect to the right diagonal
                System.out.println("Ball hit left wall at (" + r + "," + c + "), reflecting right");
                return reflectRightFrom(ballRow, ballCol);
            } else if (strength[r][c] > 0) {
                // Hit brick
                strength[r][c]--;
                if (strength[r][c] == 0) {
                    grid[r][c] = ' ';
                }
                return true;
            }
            r--;
            c--;
        }
        return false;
    }

    // Move ball diagonally right-upwards
    static boolean moveRightDiagonal() {
        int r = ballRow - 1;
        int c = ballCol + 1;

        while (r > 0 && c < 6) {
            if (grid[r][c] == 'w') {
                // Reflect to the left diagonal
                System.out.println("Ball hit right wall at (" + r + "," + c + "), reflecting left");
                return reflectLeftFrom(ballRow, ballCol);
            } else if (strength[r][c] > 0) {
                strength[r][c]--;
                if (strength[r][c] == 0) {
                    grid[r][c] = ' ';
                }
                return true;
            }
            r--;
            c++;
        }
        return false;
    }

    // Reflect ball rightwards after hitting left wall (in Lt)
    static boolean reflectRightFrom(int startRow, int startCol) {
        int r = startRow - 1;
        int c = startCol + 1;
        while (r > 0 && c < 6) {
            if (grid[r][c] == 'w') {
                System.out.println("Reflection hit wall at (" + r + "," + c + "), stop.");
                return false;
            } else if (strength[r][c] > 0) {
                strength[r][c]--;
                if (strength[r][c] == 0) {
                    grid[r][c] = ' ';
                }
                return true;
            }
            r--;
            c++;
        }
        return false;
    }

    // Reflect ball leftwards after hitting right wall (in Rt)
    static boolean reflectLeftFrom(int startRow, int startCol) {
        int r = startRow - 1;
        int c = startCol - 1;
        while (r > 0 && c > 0) {
            if (grid[r][c] == 'w') {
                System.out.println("Reflection hit wall at (" + r + "," + c + "), stop.");
                return false;
            } else if (strength[r][c] > 0) {
                strength[r][c]--;
                if (strength[r][c] == 0) {
                    grid[r][c] = ' ';
                }
                return true;
            }
            r--;
            c--;
        }
        return false;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                         21/05/25/179
131)
Spiral Matrix 

import java.util.List;
import java.util.ArrayList;

class Main{
   public static void main(String[]args){
      int matrix[][] = {
        {25, 24, 23, 22, 21},
        {20, 19, 18, 17, 16},
        {15, 14, 13, 12, 11},
        {10,  9,  8,  7,  6},
        {5,  4,  3,  2,  1}

      };
      System.out.println(clockwiseFromLeft(matrix));
      System.out.println(antiClockwiseFromCenter(matrix));
      System.out.println(clockwiseFromCenter(matrix));
   }

   private static List<Integer> clockwiseFromLeft(int matrix[][]){
       List<Integer> result = new ArrayList();
       int rowBegin = 0;
       int colBegin = 0;
       int rowEnd = matrix.length-1;
       int colEnd = matrix[0].length-1;

       while(rowBegin <= rowEnd && colBegin <= colEnd){
           for(int i=colBegin;i<=colEnd;i++)
              result.add(matrix[rowBegin][i]);
           rowBegin++;

           for(int i=rowBegin;i<=rowEnd;i++)
              result.add(matrix[i][colEnd]);
           colEnd--;

           if(rowBegin <= rowEnd){
              for(int i=colEnd;i>=colBegin;i--)
                result.add(matrix[rowEnd][i]);
              rowEnd--;
           }

           if(colBegin <= colEnd){
              for(int i=rowEnd;i>=rowBegin;i--)
                result.add(matrix[i][colBegin]);
              colBegin++;
           }
       }
       return result;
   }

   private static List<Integer> antiClockwiseFromCenter(int matrix[][]){
       List<Integer> result = new ArrayList();
       int m = matrix.length;
       int n = matrix[0].length;

       int x = m/2;
       int y = n/2;

       if(m%2==0)
         x--;
       if(n%2==0)
         y--;

       result.add(matrix[x][y]);
       int d[][] = {{0,-1},{1,0},{0,1},{-1,0}};
       int step = 1;

       while(result.size() < m*n){
          for(int i=0;i<d.length;i++){
             for(int j=0;j<step;j++){
               x+=d[i][0];
               y+=d[i][1];
               if(x>=0 && x<m && y>=0 && y<m)
                  result.add(matrix[x][y]);
             }
             if(i%2==1)
               step++;
          }
       }
       return result;
   }

   private static List<Integer> clockwiseFromCenter(int matrix[][]){
      List<Integer> result = new ArrayList();
      int m = matrix.length;
      int n = matrix[0].length;

      int x = m/2;
      int y = n/2;

      if(m%2==0)
        x--;
      if(n%2==0)
        y--;
     
      result.add(matrix[x][y]);
      int d[][] = {{0,1},{1,0},{0,-1},{-1,0}};
      int step = 1;

      while(result.size() < m*n){
         for(int i=0;i<d.length;i++){
           for(int j=0;j<step;j++){
             x+=d[i][0];
             y+=d[i][1];
             if(x>=0 && x<m && y>=0 && y<n)
                result.add(matrix[x][y]);
           }
           if(i==1 || i==3)
             step++;
         }
      }
      return result;
   }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                     3/6/2025/166
132)
import java.util.*;

class Main {
    public static void main(String[] args) {
        int[][] matrix = {
            {1, 2, 3},
            {-1, 0, 0},
            {0, 0, 0}
        };
        int k = 3, target = 6;

        List<List<Integer>> result = findKSumCombinations(matrix, k, target);
        System.out.println(result);
    }

    public static List<List<Integer>> findKSumCombinations(int[][] matrix, int k, int target) {
        List<List<Integer>> result = new ArrayList<>();
        List<Integer> nums = new ArrayList<>();

        for (int[] row : matrix)
            for (int val : row)
                nums.add(val);

        backtrack(nums, 0, k, target, new ArrayList<>(), result);
        return result;
    }

    private static void backtrack(List<Integer> nums, int start, int k, int target,
                                  List<Integer> path, List<List<Integer>> result) {
        if (k == 0 && target == 0) {
            result.add(new ArrayList<>(path));
            return;
        }
        if (k == 0 || target < 0) 
            return;

        for (int i = start; i < nums.size(); i++) {
            path.add(nums.get(i));
            backtrack(nums, i + 1, k - 1, target - nums.get(i), path, result);
            path.remove(path.size() - 1);
        }
    }
}                                                                                                     
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                          30/06/2025/139
133)LFU Cache (LEETCODE 460)

import java.util.Map;
import java.util.HashMap;

class Node{
       private int key;
       private int value;
       private int frequency;
       private Node next;
       private Node previous;
       
       Node(int key, int value){
            this.key = key;
            this.value = value;
            this.frequency = 1;
       }
       
       public void setKey(int key){
           this.key = key;
       }
       
       public int getKey(){
           return this.key;
       }
       
       public void setValue(int value){
           this.value = value;
       }
       
       public int getValue(){
            return this.value;
       }
       
       public void setFrequency(int frequency){
             this.frequency = frequency;
       }
       
       public int getFrequency(){
            return this.frequency;
       }
       
       public void setNext(Node next){
            this.next = next;
       }
       
       public Node getNext(){
            return this.next;
       }
       
       public void setPrevious(Node previous){
            this.previous = previous;
       }
       
       public Node getPrevious(){
             return this.previous;
       }
}

class DoublyLinkedList{
         private int listSize;
         private Node head;
         private Node tail;
         
         DoublyLinkedList(){
              this.listSize = 0;
              this.head = new Node(-1,-1);
              this.tail = new Node(-1,-1);
              head.setNext(tail);
              tail.setPrevious(head);
         }
         
         public int getListSize(){
               return this.listSize;
         }
         
         public Node getHead(){
              return this.head;
         }
         
         public Node getTail(){
              return this.tail;
         }
         
         public void insertAtHead(Node node){
              Node nextNode = head.getNext();
              head.setNext(node);
              node.setPrevious(head);
              node.setNext(nextNode);
              nextNode.setPrevious(node);
              listSize++;
         }
         
         public void removeNode(Node node){
               Node nextNode  = node.getNext();
               Node previousNode = node.getPrevious();
               nextNode.setPrevious(previousNode);
               previousNode.setNext(nextNode);
               listSize--;
         }
}

public class LFUCache{
         private final int capacity;
         private int size;
         private int minFrequency;
         private Map<Integer, Node> lfuMap;
         private Map<Integer, DoublyLinkedList> frequencyMap;
         
         public LFUCache(int capacity){
              this.capacity = capacity;
              this.size = 0;
              this.minFrequency = 0;
              this.lfuMap  = new HashMap();
              this.frequencyMap = new HashMap();
         }
         
         public int get(int key){
             Node node = lfuMap.get(key);
             if(node == null)
                 return -1;
             updateNode(node);
             return node.getValue();
         }
         
         public void put(int key, int value){
             if(capacity == 0)
                  return;
             if(lfuMap.containsKey(key)){
                  Node node = lfuMap.get(key);
                  node.setValue(value);
                  updateNode(node);
             }
             else{
                  size++;
                  if(size > capacity){
                        DoublyLinkedList minFrequencyList = frequencyMap.get(minFrequency); 
                        lfuMap.remove(minFrequencyList.getTail().getPrevious().getKey());
                        minFrequencyList.removeNode(minFrequencyList.getTail().getPrevious());
                        size--;
                  }
                  minFrequency = 1;
                  Node newNode = new Node(key, value);
                  
                  DoublyLinkedList currentList = frequencyMap.getOrDefault(1, new DoublyLinkedList());
                  currentList.insertAtHead(newNode);
                  frequencyMap.put(1, currentList);
                  lfuMap.put(key, newNode);
             }
         }
         
         private void updateNode(Node node){
               int currentFrequency = node.getFrequency();
               DoublyLinkedList currentList = frequencyMap.get(currentFrequency);
               currentList.removeNode(node);
               
               if(currentFrequency == minFrequency && currentList.getListSize()==0)
                     minFrequency++;
               
               node.setFrequency(currentFrequency+1);
               DoublyLinkedList newList = frequencyMap.getOrDefault(node.getFrequency(), new DoublyLinkedList());
               newList.insertAtHead(node);
               frequencyMap.put(node.getFrequency(), newList);
         }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
133)
3 sum(LEETCODE 15)

Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]

import java.util.Set;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

class Main {
    public List<List<Integer>> threeSum(int[] nums) {
        Set<List<Integer>> result = new HashSet();
        Arrays.sort(nums);
        for(int i=0;i<nums.length-2;i++){
            int left = i+1;
            int right = nums.length-1;

            while(left < right){
                int sum = nums[i] + nums[left] + nums[right];
                if(sum==0)
                  result.add(Arrays.asList(nums[i], nums[left++], nums[right--]));
                else if(sum<0)
                   left++;
                else
                   right--;     
            }
        }
        return new ArrayList(result);
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
134)
3 Sum Closest(LEETCODE 16)
Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.
Return the sum of the three integers.
Input: nums = [-1,2,1,-4], target = 1
Output: 2

import java.util.Arrays;

class Main {
    public int threeSumClosest(int[] nums, int target) {
        Arrays.sort(nums);
        int closestSum = nums[0] + nums[1] + nums[2]; 
        int difference = Integer.MAX_VALUE;
        for (int i = 0; i < nums.length - 2; i++) {
            int left = i + 1, right = nums.length - 1;
            while (left < right) {
                int currentSum = nums[i] + nums[left] + nums[right];
                if (currentSum == target) 
                   return currentSum;
                if (currentSum < target) 
                    left++; 
                else 
                    right--; 
                int diffToTarget = Math.abs(currentSum-target);
                if(diffToTarget < difference){
                    closestSum = currentSum;
                    difference = diffToTarget;
                }    
            }
        }
        return closestSum;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
135)
BinaryTree Inorder Traversal(LEETCODE 94)

Given the root of a binary tree, return the inorder traversal of its nodes values.
Example 1:
Input: root = [1,null,2,3]
Output: [1,3,2]

import java.util.List;
import java.util.LinkedList;

class Main {
    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> list = new LinkedList();
        inorderTraversal(root, list);
        return list;
    }

    private void inorderTraversal(TreeNode root, List list){
        if(root==null)
           return;
        inorderTraversal(root.left, list);
        list.add(root.val);
        inorderTraversal(root.right,list);   
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
136)
BinaryTree LevelOrder Traversal(LEETCODE 100)

Given the root of a binary tree, return the level order traversal of its nodes values. (i.e., from left to right, level by level).
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]

import java.util.List;
import java.util.ArrayList;
import java.util.Queue;
import java.util.LinkedList;

class Solution {
    public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>> result = new ArrayList();
        Queue<TreeNode> queue = new LinkedList();
        queue.add(root);
        if(root==null)
           return result;
        while(!queue.isEmpty()){
            List<Integer> list = new ArrayList();
            int size = queue.size();
            while(size-->0){
                TreeNode currentNode = queue.poll();
                list.add(currentNode.val);
                if(currentNode.left!=null)
                   queue.offer(currentNode.left);
                if(currentNode.right!=null)
                   queue.offer(currentNode.right);   
            }
            result.add(list);
        }   
        return result;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
137)
House Robber II (LEETCODE 213)

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at 
place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system 
connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.
Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight 
without alerting the police.

Input: nums = [2,3,2]
Output: 3
Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.

class Solution {
    public int rob(int[] nums) {
        if (nums.length <2) 
           return nums[0];

        int[] skipFirstHouse = new int[nums.length - 1];
        int[] skipLastHouse = new int[nums.length - 1];

        for(int i=0;i<nums.length-1;i++){
            skipFirstHouse[i] = nums[i+1];
            skipLastHouse[i] = nums[i];
        }

        int lootSkippingFirst = findRobAmount(skipFirstHouse);
        int lootSkippingLast = findRobAmount(skipLastHouse);

        return Math.max(lootSkippingFirst, lootSkippingLast);
    }

    private int findRobAmount(int[] nums) {
        if (nums.length == 1) 
           return nums[0];

        int[] dp = new int[nums.length];
        dp[0] = nums[0];
        dp[1] = Math.max(nums[0], nums[1]);

        for (int i = 2; i < nums.length; i++) 
            dp[i] = Math.max(dp[i - 2] + nums[i], dp[i - 1]);
        
        return dp[nums.length - 1];
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
138)
Happy Number(LEETCODE 202)

Write an algorithm to determine if a number n is happy.
A happy number is a number defined by the following process:
Starting with any positive integer, replace the number by the sum of the squares of its digits.
Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
Those numbers for which this process ends in 1 are happy.
Return true if n is a happy number, and false if not.

Example :
Input: n = 19
Output: true
Explanation:
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1

class Solution {
    public boolean isHappy(int n) {
        if(isNumIsHappy(n))
            return true;
        return false;    
    }

    private boolean isNumIsHappy(int num){
        while(num!=1 && num!=4)
             num = sumOfSquareOfDigits(num);
        return num==1;     
    }

    private int sumOfSquareOfDigits(int num){
        int sum = 0;
        while(num > 0){
            int digit = num%10;
            sum+=digit * digit;
            num/=10;
        }
        return sum;
    }       
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
139)
Counting Bits(LEETCODE 338)

Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1s in the binary  
representation of i
 
Example :
Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10

class Solution {
    public int[] countBits(int n) {
        int[] ans = new int[n + 1];
        for (int i = 0; i <= n; i++) 
            ans[i] = Integer.bitCount(i); 
        return ans;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
140)
Longest Increasing subsequence(LEETCODE 300)

Given an integer array nums, return the length of the longest strictly increasing subsequence.

Example :
Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

import java.util.TreeSet;

class Solution {
    public int lengthOfLIS(int[] nums) {
        TreeSet<Integer> treeSet = new TreeSet();
        treeSet.add(nums[0]);

        for(int i=1;i<nums.length;i++){
            if(nums[i] < treeSet.last()){
                int next = treeSet.ceiling(nums[i]);
                treeSet.remove(next);
            }
            treeSet.add(nums[i]);
        }
        return treeSet.size();
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
141)
Last Stone weight(LEETCODE 1046)
You are given an array of integers stones where stones[i] is the weight of the ith stone.
We are playing a game with the stones. On each turn, we choose the heaviest two stones and smash them together. Suppose the heaviest 
two stones have weights x and y with x <= y. The result of this smash is:

If x == y, both stones are destroyed, and
If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x.
At the end of the game, there is at most one stone left.

Return the weight of the last remaining stone. If there are no stones left, return 0.

Example :
Input: stones = [2,7,4,1,8,1]
Output: 1
Explanation: 
We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
we combine 1 and 1 to get 0 so the array converts to [1] then thats the value of the last stone.

import java.util.PriorityQueue;

class Solution {
    public int lastStoneWeight(int[] stones) {
        PriorityQueue<Integer> queue = new PriorityQueue<>((a, b) -> b - a);
        for(int stone : stones)
           queue.offer(stone);
        while(!queue.isEmpty()){
            int firstStone = queue.poll();
            if(queue.isEmpty())
               return firstStone;
            int secondStone = queue.poll();
            if(firstStone!=secondStone)
              queue.offer(Math.abs(firstStone-secondStone));
        }   
        return 0;
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
142)
Find the length of the longest valid substring. The valid String contains open and closed parentheses, and atleast one lowercase character
input : (a)(bc)()
output : 7
input : ()
output : 0;

import java.util.Stack;

class Main{
     public static void main(String[]args){
           String s = "(a)(bc)()";
           System.out.println(findLongestValidSubstring(s));
     }
     
     private static int findLongestValidSubstring(String s){
            int length = s.length();
            boolean[] visited = new boolean[length];
            Stack<Integer> stack = new Stack();
            
            for(int i=0;i<length;i++){
                 char ch = s.charAt(i);
                 if(ch=='('){
                       stack.push(i);
                 }
                 else if(ch==')'){
                       if(!stack.isEmpty()){
                             int start = stack.pop();
                             String insideString = s.substring(start+1,i);
                             if(insideString.matches(".*[a-z]*.")){
                                   for(int j = start ; j<=i;j++)
                                         visited[j] = true;
                             }
                       }
                 }
            }
            
            int currentLength = 0;
            int maxLength = 0;
            for(int i=0;i<length;i++){
                if(visited[i]){
                     currentLength++;
                     maxLength = Math.max(currentLength, maxLength);
                }
                else
                      currentLength = 0;
            }
            return maxLength;
     }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
143)
waveform pattern of Array (a1 <= a2 >= a3 <= a4 >= a5 ...   // o r//  a1 >= a2 <= a3 >= a4 <= a5 ...)
input: {10,15,20,3,8,6}
for(a1 >= a2 <= a3 >= a4 <= a5 )
output : [10, 20, 3, 15, 6, 8]
for(a1 <= a2 >= a3 <= a4 >= a5 )
output : [15, 10, 20, 3, 8, 6]

import java.util.Arrays;

class Main{
      public static void main(String[]args){
             int[] nums = {10, 15, 20, 3, 8, 6};
             //upDownConversion(nums);
           //  downUpConversion(nums);
      }
      
      public static void downUpConversion(int nums[]){
             for(int i=0;i<nums.length;i+=2){
                  if(nums[i] < nums[i+1])
                       swap(nums, i, i+1);
             }
             System.out.println(Arrays.toString(nums));
      }
      
      public static void upDownConversion(int nums[]){
            for(int i=1;i<nums.length;i+=2){
                if(nums[i-1] > nums[i])
                     swap(nums, i-1, i);
                if(i+1 < nums.length && nums[i] < nums[i+1])
                     swap(nums, i, i+1);
            }
      }
      
      private static void swap(int nums[], int left , int right){
             int temp = nums[left];
             nums[left] = nums[right];
             nums[right] = temp;
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                             2/7/25/137
144)
Given a 4*4 matrix select records based on the given criteria
1 22 33 44
2 45 67 89
3 21 54 78
4 67 98 11
Consider Column 1 as roll number - R, Column 2 as Mark1 - A, Column 3 as Mark2 - B and Column 4 as Mark3 - C
Possible criteria
> - greater than
< - less than
= - equal to
Input Format: The 1st line contains the column(s) that needs to be shown in the output. * will be considered as all. The 2nd line contains the criteria/ conditions

Sample input 1:                   Sample Input 2:
*                                              C
A>40                                       C<60
Output:                                   Output:
2 45 67 89                             44
4 67 98 11                             11

import java.util.Scanner;
import java.util.Map;
import java.util.HashMap;

class Main{
      @SuppressWarnings("unchecked")
      public static void main(String[]args){
           Scanner input = new Scanner(System.in);
           
            int[][] data = {
           	 {1, 22, 33, 44},
           	 {2, 45, 67, 89},
           	 {3, 21, 54, 78},
           	 {4, 67, 98, 11}
           };
           
           Map<String, Integer> map = new HashMap();
           map.put("R",0);
           map.put("A",1);
           map.put("B",2);
           map.put("C",3);
           
           System.out.println("Enter the Values:");
           System.out.println("Enter the Column for Display:");
           String displayColumn = input.nextLine().trim();
           System.out.println("Enter the condition");
           String condition = input.nextLine().trim();
           
           char colName = condition.charAt(0);
           char operator = condition.charAt(1);
           int value = Integer.parseInt(condition.substring(2));
           
           int respectiveColumn = map.get(String.valueOf(colName));
           
           for(int i=0;i<data.length;i++){
                  int element = data[i][respectiveColumn];
                  boolean flag = false;
                  
                  if(operator == '>' && element > value)
                        flag = true;
                  else if(operator == '<' && element < value)
                         flag = true;
                  else if(operator == '=' && element == value)
                         flag = true;
                         
                  if(flag){
                         if(displayColumn.equals("*"))
                                for(int j=0; j<4 ;j++)
                                       System.out.print(data[i][j] + " " );
                         else {
                                 String cols[] = displayColumn.split("");
                                 for(String col : cols){
                                          int index = map.get(col);
                                          System.out.print(data[i][index] + " ");
                                 }
                         }
                         System.out.println();
                  }
           }
      }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
145)
Valid parentheses

import java.util.Stack;

class Brackets {
    public static void main(String[] args) {
        String s = "()())";
        Stack<Character> stack = new Stack<>();
        boolean flag = false;

        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (ch == '(' || ch == '{' || ch == '[') 
                stack.push(ch);
             else {
                if (!stack.isEmpty()) {
                    char val = stack.peek();
                    if (ch == ')' && val == '(' || ch == '}' && val == '{' || ch == ']' && val == '[') 
                        stack.pop();
                    else {
                        flag = true;
                        break;
                    }
                } 
                else {
                    flag = true;
                    break;
                }
            }
        }

        if (!flag && stack.isEmpty()) 
            System.out.println("valid String");
        else 
            System.out.println("Invalid String");
    }
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
