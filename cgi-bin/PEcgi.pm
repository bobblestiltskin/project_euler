package PEcgi;

use strict;
use Carp qw(carp croak confess);
use CGI;
use LWP::UserAgent;
use XML::LibXML;

use Exporter;
our (@ISA, @EXPORT_OK);
@ISA =qw(Exporter);
@EXPORT_OK = qw(display_file 
                get_web_page
                decode_web_page
                get_problem_as_string
                print_language_number
                $extensions
                $problems);

our $extensions = {
  asm           => 's',
  c             => 'c',
  'c++'         => 'cpp',
  erlang        => 'erl',
  elixir        => 'exs',
  forth         => 'fs',
  go            => 'go',
  haskell       => 'hs',
  java          => 'java',
  javascript    => 'js',
  lua           => 'lua',
  ocaml         => 'ml',
  perl          => 'pl',
  perl6         => 'pl',
  python        => 'py',
  racket        => 'rkt',
  ruby          => 'rb',
  rust          => 'rs',
  tcl           => 'tcl',
  typescript    => 'ts',
};
#  haskell       => 'hs',

our $problems = [
  '<p>If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.</p><p>Find the sum of all the multiples of 3 or 5 below 1000.</p>',
  '<p>Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:</p><p class="center">1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...</p>
<p>By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.</p>',
  '<p>The prime factors of 13195 are 5, 7, 13 and 29.</p><p>What is the largest prime factor of the number 600851475143 ?</p>',
  '<p>A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.</p><p>Find the largest palindrome made from the product of two 3-digit numbers.</p>',
  '<p>2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.</p><p>What is the smallest positive number that is <dfn title="divisible with no remainder">evenly divisible</dfn> by all of the numbers from 1 to 20?</p>',
  '<p>The sum of the squares of the first ten natural numbers is,</p> $$1^2 + 2^2 + ... + 10^2 = 385$$ <p>The square of the sum of the first ten natural numbers is,</p> $$(1 + 2 + ... + 10)^2 = 55^2 = 3025$$ <p>Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is $3025 - 385 = 2640$.</p> <p>Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.</p>',
  '<p>By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.</p><p>What is the 10 001st prime number?</p>',
  '<p>The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.</p>
<p class="monospace center">
73167176531330624919225119674426574742355349194934<br />
96983520312774506326239578318016984801869478851843<br />
85861560789112949495459501737958331952853208805511<br />
12540698747158523863050715693290963295227443043557<br />
66896648950445244523161731856403098711121722383113<br />
62229893423380308135336276614282806444486645238749<br />
30358907296290491560440772390713810515859307960866<br />
70172427121883998797908792274921901699720888093776<br />
65727333001053367881220235421809751254540594752243<br />
52584907711670556013604839586446706324415722155397<br />
53697817977846174064955149290862569321978468622482<br />
83972241375657056057490261407972968652414535100474<br />
82166370484403199890008895243450658541227588666881<br />
16427171479924442928230863465674813919123162824586<br />
17866458359124566529476545682848912883142607690042<br />
24219022671055626321111109370544217506941658960408<br />
07198403850962455444362981230987879927244284909188<br />
84580156166097919133875499200524063689912560717606<br />
05886116467109405077541002256983155200055935729725<br />
71636269561882670428252483600823257530420752963450<br /></p>
<p>Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?</p>
',
  '<p>A Pythagorean triplet is a set of three natural numbers, <var>a</var> &lt; <var>b</var> &lt; <var>c</var>, for which,</p>
<div class="center"> <var>a</var><sup>2</sup> + <var>b</var><sup>2</sup> = <var>c</var><sup>2</sup></div>
<p>For example, 3<sup>2</sup> + 4<sup>2</sup> = 9 + 16 = 25 = 5<sup>2</sup>.</p>
<p>There exists exactly one Pythagorean triplet for which <var>a</var> + <var>b</var> + <var>c</var> = 1000.<br />Find the product <var>abc</var>.</p>
',
  '<p>The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.</p>
<p>Find the sum of all the primes below two million.</p>
',
  '<p>In the 20×20 grid below, four numbers along a diagonal line have been marked in red.</p>
<p class="monospace center">
08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08<br />
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00<br />
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65<br />
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91<br />
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80<br />
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50<br />
32 98 81 28 64 23 67 10 <span class="red"><b>26</b></span> 38 40 67 59 54 70 66 18 38 64 70<br />
67 26 20 68 02 62 12 20 95 <span class="red"><b>63</b></span> 94 39 63 08 40 91 66 49 94 21<br />
24 55 58 05 66 73 99 26 97 17 <span class="red"><b>78</b></span> 78 96 83 14 88 34 89 63 72<br />
21 36 23 09 75 00 76 44 20 45 35 <span class="red"><b>14</b></span> 00 61 33 97 34 31 33 95<br />
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92<br />
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57<br />
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58<br />
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40<br />
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66<br />
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69<br />
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36<br />
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16<br />
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54<br />
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48<br /></p>
<p>The product of these numbers is 26 × 63 × 78 × 14 = 1788696.</p>
<p>What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?</p>

',
  '<p>The sequence of triangle numbers is generated by adding the natural numbers. So the 7<sup>th</sup> triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:</p>
<p class="center">1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...</p>
<p>Let us list the factors of the first seven triangle numbers:</p>
<blockquote class="monospace"><b> 1</b>: 1<br /><b> 3</b>: 1,3<br /><b> 6</b>: 1,2,3,6<br /><b>10</b>: 1,2,5,10<br /><b>15</b>: 1,3,5,15<br /><b>21</b>: 1,3,7,21<br /><b>28</b>: 1,2,4,7,14,28</blockquote>
<p>We can see that 28 is the first triangle number to have over five divisors.</p>
<p>What is the value of the first triangle number to have over five hundred divisors?</p>
',
  '<p>Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.</p>
<div class="monospace center">
37107287533902102798797998220837590246510135740250<br />
46376937677490009712648124896970078050417018260538<br />
74324986199524741059474233309513058123726617309629<br />
91942213363574161572522430563301811072406154908250<br />
23067588207539346171171980310421047513778063246676<br />
89261670696623633820136378418383684178734361726757<br />
28112879812849979408065481931592621691275889832738<br />
44274228917432520321923589422876796487670272189318<br />
47451445736001306439091167216856844588711603153276<br />
70386486105843025439939619828917593665686757934951<br />
62176457141856560629502157223196586755079324193331<br />
64906352462741904929101432445813822663347944758178<br />
92575867718337217661963751590579239728245598838407<br />
58203565325359399008402633568948830189458628227828<br />
80181199384826282014278194139940567587151170094390<br />
35398664372827112653829987240784473053190104293586<br />
86515506006295864861532075273371959191420517255829<br />
71693888707715466499115593487603532921714970056938<br />
54370070576826684624621495650076471787294438377604<br />
53282654108756828443191190634694037855217779295145<br />
36123272525000296071075082563815656710885258350721<br />
45876576172410976447339110607218265236877223636045<br />
17423706905851860660448207621209813287860733969412<br />
81142660418086830619328460811191061556940512689692<br />
51934325451728388641918047049293215058642563049483<br />
62467221648435076201727918039944693004732956340691<br />
15732444386908125794514089057706229429197107928209<br />
55037687525678773091862540744969844508330393682126<br />
18336384825330154686196124348767681297534375946515<br />
80386287592878490201521685554828717201219257766954<br />
78182833757993103614740356856449095527097864797581<br />
16726320100436897842553539920931837441497806860984<br />
48403098129077791799088218795327364475675590848030<br />
87086987551392711854517078544161852424320693150332<br />
59959406895756536782107074926966537676326235447210<br />
69793950679652694742597709739166693763042633987085<br />
41052684708299085211399427365734116182760315001271<br />
65378607361501080857009149939512557028198746004375<br />
35829035317434717326932123578154982629742552737307<br />
94953759765105305946966067683156574377167401875275<br />
88902802571733229619176668713819931811048770190271<br />
25267680276078003013678680992525463401061632866526<br />
36270218540497705585629946580636237993140746255962<br />
24074486908231174977792365466257246923322810917141<br />
91430288197103288597806669760892938638285025333403<br />
34413065578016127815921815005561868836468420090470<br />
23053081172816430487623791969842487255036638784583<br />
11487696932154902810424020138335124462181441773470<br />
63783299490636259666498587618221225225512486764533<br />
67720186971698544312419572409913959008952310058822<br />
95548255300263520781532296796249481641953868218774<br />
76085327132285723110424803456124867697064507995236<br />
37774242535411291684276865538926205024910326572967<br />
23701913275725675285653248258265463092207058596522<br />
29798860272258331913126375147341994889534765745501<br />
18495701454879288984856827726077713721403798879715<br />
38298203783031473527721580348144513491373226651381<br />
34829543829199918180278916522431027392251122869539<br />
40957953066405232632538044100059654939159879593635<br />
29746152185502371307642255121183693803580388584903<br />
41698116222072977186158236678424689157993532961922<br />
62467957194401269043877107275048102390895523597457<br />
23189706772547915061505504953922979530901129967519<br />
86188088225875314529584099251203829009407770775672<br />
11306739708304724483816533873502340845647058077308<br />
82959174767140363198008187129011875491310547126581<br />
97623331044818386269515456334926366572897563400500<br />
42846280183517070527831839425882145521227251250327<br />
55121603546981200581762165212827652751691296897789<br />
32238195734329339946437501907836945765883352399886<br />
75506164965184775180738168837861091527357929701337<br />
62177842752192623401942399639168044983993173312731<br />
32924185707147349566916674687634660915035914677504<br />
99518671430235219628894890102423325116913619626622<br />
73267460800591547471830798392868535206946944540724<br />
76841822524674417161514036427982273348055556214818<br />
97142617910342598647204516893989422179826088076852<br />
87783646182799346313767754307809363333018982642090<br />
10848802521674670883215120185883543223812876952786<br />
71329612474782464538636993009049310363619763878039<br />
62184073572399794223406235393808339651327408011116<br />
66627891981488087797941876876144230030984490851411<br />
60661826293682836764744779239180335110989069790714<br />
85786944089552990653640447425576083659976645795096<br />
66024396409905389607120198219976047599490197230297<br />
64913982680032973156037120041377903785566085089252<br />
16730939319872750275468906903707539413042652315011<br />
94809377245048795150954100921645863754710598436791<br />
78639167021187492431995700641917969777599028300699<br />
15368713711936614952811305876380278410754449733078<br />
40789923115535562561142322423255033685442488917353<br />
44889911501440648020369068063960672322193204149535<br />
41503128880339536053299340368006977710650566631954<br />
81234880673210146739058568557934581403627822703280<br />
82616570773948327592232845941706525094512325230608<br />
22918802058777319719839450180888072429661980811197<br />
77158542502016545090413245809786882778948721859617<br />
72107838435069186155435662884062257473692284509516<br />
20849603980134001723930671666823555245252804609722<br />
53503534226472524250874054075591789781264330331690<br /></div>

',
  '<p>The following iterative sequence is defined for the set of positive integers:</p>
<p class="margin_left"><var>n</var> → <var>n</var>/2 (<var>n</var> is even)<br /><var>n</var> → 3<var>n</var> + 1 (<var>n</var> is odd)</p>
<p>Using the rule above and starting with 13, we generate the following sequence:</p>
<div class="center">13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1</div>
<p>It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.</p>
<p>Which starting number, under one million, produces the longest chain?</p>
<p class="note"><b>NOTE:</b> Once the chain starts the terms are allowed to go above one million.</p>',
  '<p>Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.</p>
<div class="center">
<img src="project/images/p015.png" class="dark_img" alt="" /></div>
<p>How many such routes are there through a 20×20 grid?</p>

',
  '<p>2<sup>15</sup> = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.</p>
<p>What is the sum of the digits of the number 2<sup>1000</sup>?</p>

',
  '<p>If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.</p>
<p>If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used? </p>
<br /><p class="note"><b>NOTE:</b> Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.</p>
',
  '<p>By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.</p>
<p class="monospace center"><span class="red"><b>3</b></span><br /><span class="red"><b>7</b></span> 4<br />
2 <span class="red"><b>4</b></span> 6<br />
8 5 <span class="red"><b>9</b></span> 3</p>
<p>That is, 3 + 7 + 4 + 9 = 23.</p>
<p>Find the maximum total from top to bottom of the triangle below:</p>
<p class="monospace center">75<br />
95 64<br />
17 47 82<br />
18 35 87 10<br />
20 04 82 47 65<br />
19 01 23 75 03 34<br />
88 02 77 73 07 63 67<br />
99 65 04 28 06 16 70 92<br />
41 41 26 56 83 40 80 70 33<br />
41 48 72 33 47 32 37 16 94 29<br />
53 71 44 65 25 43 91 52 97 51 14<br />
70 11 33 28 77 73 17 78 39 68 17 57<br />
91 71 52 38 17 14 91 43 58 50 27 29 48<br />
63 66 04 68 89 53 67 30 73 16 69 87 40 31<br />
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23</p>
<p class="note"><b>NOTE:</b> As there are only 16384 routes, it is possible to solve this problem by trying every route. However, <a href="problem=67">Problem 67</a>, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)</p>
',
  '<p>You are given the following information, but you may prefer to do some research for yourself.</p>
<ul><li>1 Jan 1900 was a Monday.</li>
<li>Thirty days has September,<br />
April, June and November.<br />
All the rest have thirty-one,<br />
Saving February alone,<br />
Which has twenty-eight, rain or shine.<br />
And on leap years, twenty-nine.</li>
<li>A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.</li>
</ul><p>How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?</p>

',
  '<p><i>n</i>! means <i>n</i> × (<i>n</i> − 1) × ... × 3 × 2 × 1</p>
<p>For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,<br />and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.</p>
<p>Find the sum of the digits in the number 100!</p>

',
  '<p>Let d(<i>n</i>) be defined as the sum of proper divisors of <i>n</i> (numbers less than <i>n</i> which divide evenly into <i>n</i>).<br />
If d(<i>a</i>) = <i>b</i> and d(<i>b</i>) = <i>a</i>, where <i>a</i> ≠ <i>b</i>, then <i>a</i> and <i>b</i> are an amicable pair and each of <i>a</i> and <i>b</i> are called amicable numbers.</p>
<p>For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.</p>
<p>Evaluate the sum of all the amicable numbers under 10000.</p>
',
  '<p>Using <a href="project/resources/p022_names.txt">names.txt</a> (right click and "Save Link/Target As..."), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.</p>
<p>For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.</p>
<p>What is the total of all the name scores in the file?</p>

',
  '<p>A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.</p>
<p>A number <var>n</var> is called deficient if the sum of its proper divisors is less than <var>n</var> and it is called abundant if this sum exceeds <var>n</var>.</p>

<p>As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.</p>
<p>Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.</p>

',
  '<p>A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:</p>
<p class="center">012   021   102   120   201   210</p>
<p>What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?</p>

',
  '<p>The Fibonacci sequence is defined by the recurrence relation:</p>
<blockquote>F<sub><i>n</i></sub> = F<sub><i>n</i>−1</sub> + F<sub><i>n</i>−2</sub>, where F<sub>1</sub> = 1 and F<sub>2</sub> = 1.</blockquote>
<p>Hence the first 12 terms will be:</p>
<blockquote>F<sub>1</sub> = 1<br />
F<sub>2</sub> = 1<br />
F<sub>3</sub> = 2<br />
F<sub>4</sub> = 3<br />
F<sub>5</sub> = 5<br />
F<sub>6</sub> = 8<br />
F<sub>7</sub> = 13<br />
F<sub>8</sub> = 21<br />
F<sub>9</sub> = 34<br />
F<sub>10</sub> = 55<br />
F<sub>11</sub> = 89<br />
F<sub>12</sub> = 144</blockquote>
<p>The 12th term, F<sub>12</sub>, is the first term to contain three digits.</p>
<p>What is the index of the first term in the Fibonacci sequence to contain 1000 digits?</p>

',
];

sub display_file {
  my $query = shift;
  my $dir = shift;
  my $file = shift;

  print '<pre class="example">' . "\n";
  print "<p><b>$file</b></p>\n";
  chomp($file = join('/', $dir, $file));
  open(my $fh, "<", $file) or print "Cannot open ",$file,": $!";
  while (<$fh>) {
    s/\&/&amp;/g;
    s/</&lt;/g;
    s/>/&gt;/g;
    print;
    if ($dir =~ m|/forth$|) {
      if (/^\s*include\s+(.+\.fs)\s*$/) {
        display_file($query, $dir, $1);
      }
    }
  }
  close $fh;
  print $query->end_pre;
}

sub get_web_page {
  my $url = shift;

  my $ua = LWP::UserAgent->new;
  $ua->agent('bob@fourtheye.org::problem_text_grabber');
#  $ua->timeout(10);
  $ua->env_proxy;

#  my $res = $ua->get($url);

  my $req = HTTP::Request->new('GET', $url);
  my $res = $ua->request($req);

  if ($res->is_error()) {
    carp "Error getting $url: ", $res->status_line, "\n";
    return undef;
  } else {
    $res->content;
  }
}

sub decode_web_page {
  my $html = shift;

  $html =~ s|You are currently using a secure connection</div>|You are currently using a secure connection|; # mend b0rken html
  my $xp = XML::LibXML->load_html(string => $html);
  return ($xp->findnodes('//*[@role="problem"]'))[0];
}

sub get_problem_as_string {
  my $number = shift;

  print '<a href="https://projecteuler.net/problem=', $number, '">Description of problem</a>',"\n";

#  my $wanted = decode_web_page(get_web_page("https://projecteuler.net/problem=$number"));
#  my $string = $wanted->toString;
#  my $string = $problems->[$number - 1];
#  $string =~ s/\&#13;//g;
#  $string =~ s|href="|href="https://projecteuler.net/|g;
#  return $string;
  return $problems->[$number - 1];
}

sub print_language_number {
  my $query = shift;
  my $dir = shift;
  my $subdir = shift;
  my $number = shift;

  my $subdirh = DirHandle->new($dir . $subdir);
  if (defined $subdirh) {
    while (defined (my $file = $subdirh->read)) {
      if ($file eq join(".", "pe" . $number, $extensions->{$subdir})) {
        print $query->h3($subdir) if ($0 =~ /problem\.pl$/);
        display_file($query, join('/', $dir, $subdir), $file);
        last;
      }
    }
    $subdirh->rewind;
    while (defined (my $file = $subdirh->read)) {
      if ($file eq "Makefile") {
        $file = join('/', $dir, $subdir, $file);
        open(my $fh, "<", $file) or print "Cannot open ",$file,": $!";
        while (<$fh>) {
          if (s/^pe$number: //) {
            my @dependencies = split(/ /);
            foreach my $file (grep {!/^pe$number/} (@dependencies)) {
              if ($file =~ /\.(s|c\w*)$/) {
                (my $header = $file) =~ s/\.\w+$/.h/;
                chomp(my $full_header = join('/', $dir, $subdir, $header));
                if (-e "$full_header") {
                  display_file($query, join('/', $dir, $subdir), $header);
                }
              }
              display_file($query, join('/', $dir, $subdir), $file);
            }
          }
        }
      }
    }
  }
}

1;
