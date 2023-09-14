ice_cream = [ 'Vanilla', 'BlackBerry', 'PanCake']
print(ice_cream)
ice_cream = [ 'Vanilla', 'BlackBerry', 'PanCake']
print(ice_cream)
['Vanilla', 'BlackBerry', 'PanCake']
type (ice_cream)
list
ice_cream.append('Stawberry')
print(ice_cream)
['Vanilla', 'BlackBerry', 'PanCake', 'Stawberry']
ice_cream[3] = 'Strawberry'
print(ice_cream)
['Vanilla', 'BlackBerry', 'PanCake', 'Strawberry']
nested_list = ['Blueberry', 15, ['Vanilla', ['Caramel','BlackBerry'],0], True, 'PanCake', 'Stawberry']
print(nested_list)
['Blueberry', 15, ['Vanilla', ['Caramel', 'BlackBerry'], 0], True, 'PanCake', 'Stawberry']
nested_list[3]
nested_list[3]
True
type()
type(nested_list[3])
bool
nested_list[2][0]
'Vanilla'
2]
nested_list[2][2]
0
a = ()
a = ()
type(a)
tuple
t)
t = (1, [3,4], True)
print(t)
(1, [3, 4], True)
type (t)
tuple
​
print(s)
s = {1,32, 4, 6, 37, 98, 54}
print(s)
{32, 1, 98, 4, 37, 6, 54}
(s)
type(s)
set
s1 ={2,4, 5.8, False, 'bricks'}
s1 ={2,4, 5.8, False, 'bricks'}
print(s1)
print(s1)
{False, 2, 4, 5.8, 'bricks'}
print(s-s1)
print(s-s1)
{32, 1, 98, 37, 6, 54}
print(s1-s)
print(s1-s)
{False, 2, 5.8, 'bricks'}
print(s^s1)
{False, 1, 2, 6, 32, 98, 37, 5.8, 'bricks', 54}
dict1 = {'Name' : 'Anjali', 'heights' : [2,5.1, 6.4], 'Age': 30 , 'bool': True}
print(dict1)
{'Name': 'Anjali', 'heights': [2, 5.1, 6.4], 'Age': 30, 'bool': True}
if 25>10:
    print('It worked...')
It worked...
if 25 < 10:
    print('it worked')
elif 25 <30:
    print('elif worked')
elif 25 <35:
    print('elif 2 worked')
else:
    print("it didn't worked")
if 25 < 10:
    print('it worked')
elif 25 <30:
    print('elif worked')
elif 25 <35:
    print('elif 2 worked')
else:
    print("it didn't worked")
    
elif worked
if 25 < 10:
    print('it worked')
elif 25 >30:
    print('elif worked')
elif 25 >35:
    print('elif 2 worked')
else:
    print("it didn't worked")
it didn't worked
if 25 < 10:
    print('it worked')
elif 25 >30:
    print('elif worked')
elif 25 <35:
    print('elif 2 worked')
else:
    print("it didn't worked")
elif 2 worked
intergers = [1,2,3,4,5]
​
for num in intergers:
    print(num)
for num in intergers:
    print(num)
1
2
3
4
5
for num in intergers:
    print('yessss!!!')
yessss!!!
yessss!!!
yessss!!!
yessss!!!
yessss!!!
for jelly in intergers:
    print(jelly+jelly)
2
4
6
8
10
ice_cream_dict = {'name': 'Anjali', 'Weekly intake': 5, 'fav ice cream': ['vanilla', 'MCC']}
for cream in ice_cream_dict.values():
    print(cream)
for cream in ice_cream_dict.values():
    print(cream)
Anjali
5
['vanilla', 'MCC']
for key, values in ice_cream_dict.items():
    print(key, '=', values)
name = Anjali
Weekly intake = 5
fav ice cream = ['vanilla', 'MCC']
flavours = ['Vanilla', 'Black Current', 'Cranberry']
toppings = [ 'Hot fudge', 'Oreos', 'Chocolate Chips']
print( one, 'topped with' , two)
for one in flavours:
    for two in toppings:
        print( one, 'topped with' , two)
Vanilla topped with Hot fudge
Vanilla topped with Oreos
Vanilla topped with Chocolate Chips
Black Current topped with Hot fudge
Black Current topped with Oreos
Black Current topped with Chocolate Chips
Cranberry topped with Hot fudge
Cranberry topped with Oreos
Cranberry topped with Chocolate Chips
= number+1
number = 0
while number < 5:
    print(number)
    number = number+1
0
1
2
3
4
num = 0 

while num <5:
    print(num)
    if num == 3:
        break
    num = num +1
num = 0 
​
while num <5:
    print(num)
    if num == 3:
        break
    num = num +1
0
1
2
3
num = 0 
​
while num <5:
    print(num)
    if num == 6:
        break
    num = num +1
else:
    print('no longer <5')
0
1
2
3
4
no longer <5
num = 0 

while num <5:
    print(num)
    if num == 3:
        break
    num = num +1
else:
    print('no longer <5')
num = 0 
​
while num <5:
    print(num)
    if num == 3:
        break
    num = num +1
else:
    print('no longer <5')
0
1
2
3
##num = 0 
​
#while num <5:
    print(num)
    if num == 3:
#    continue
    num = num +1
#else:
    print('no longer <5') ## infinite loop
  Cell In[39], line 4
    print(num)
    ^
IndentationError: unexpected indent
num = 0 
​
while num <5:
    num = num +1
    if num == 3:
        continue
    print(num)   
else:
    print('no longer <5')    ## to avoid infinite loop
1
2
4
5
no longer <5
ked')
def first_func():
    print('it worked')
first_func()
first_func()
it worked
def number_Square(number):
    print(number**2)
number_Square(4)
16
def number_Square_cust(number, power):
    print(number**power)
def number_Square_cust(number, power):
    print(number**power)
number_Square_cust(5,3)
125
def number_args(*number):
    print(number[2]*number[3])
6,7,5,2
number_args(6,7,5,2)
10
args_tup = (6,7,5,2)
​
def number_args(*number):
    print(number[2]*number[1])
number_args(*args_tup)
35
def number_Square_cust(number, power):
    print(number**power)
number_Square_cust(power =3, number =3)
27
def number_kwargs(**number):
    print( 'My number is '  + number['int1']  +  ' and my another number is '  + number['int2'])
number_kwargs(int1 = '478956', int2 = '223658')
My number is 478956 and my another number is 223658
type(num_int)
num_int = 5
type(num_int)
int
type(num_str)
num_str = '4'
type(num_str)
str
num_str_covd = int(num_str)
type(num_str_covd)
int
_sum)
num_sum = num_str_covd + num_int
print(num_sum)
type (num_sum)
9
int
type(list_type)
list_type = [1,2,3,5,1.2]
type(list_type)
list
tuple(list_type)
type(tuple(list_type))
tuple
tuple(list_type)
(1, 2, 3, 5, 1.2)
set(list_type1)
list_type1 = [1,1,2,2,5,1,5,6,2,3,5,3]
set(list_type1)
{1, 2, 3, 5, 6}
)
type(set(list_type1))
set
dict_type 
dict_type = {'Name' : 'Anjali', 'Age': 29, 'Job': 'Data Analyst'}
type(dict_type)
dict
e.items()
dict_type.items()
dict_items([('Name', 'Anjali'), ('Age', 29), ('Job', 'Data Analyst')])
dict_type.values()
dict_type.values()
dict_values(['Anjali', 29, 'Data Analyst'])
type(dict_type.values())
dict_values
list(dict_type.values())
['Anjali', 29, 'Data Analyst']
type(list(dict_type.values()))
type(list(dict_type.values()))
list
dict_type.keys()
dict_keys(['Name', 'Age', 'Job'])
type(list(dict_type.keys()))
list
long_str = 'I love to mediate'
list(long_str)
['I',
 ' ',
 'l',
 'o',
 'v',
 'e',
 ' ',
 't',
 'o',
 ' ',
 'm',
 'e',
 'd',
 'i',
 'a',
 't',
 'e']
set(long_str)
set(long_str)
{' ', 'I', 'a', 'd', 'e', 'i', 'l', 'm', 'o', 't', 'v'}
​

Simple
0
2