Python 3.9.13 (tags/v3.9.13:6de2ca5, May 17 2022, 16:36:42) [MSC v.1929 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license()" for more information.
>>> def computue_interset(amount,rate,years) :
	value=amount*(1+rate/100)**years
	return value

>>>  computue_interset(100,1,20)
 
SyntaxError: unexpected indent
>>> computue_interset(100,1,20)
122.0190039947967
>>> def absolute(x):
    if x < 0:
        return -x
    else:
        return x

>>> def absolute(x):
    if x < 0:
        return –x
    return x
SyntaxError: invalid character '–' (U+2013)
>>> def absolute(x):
    if x < 0:
        return –x
    return x
SyntaxError: invalid character '–' (U+2013)
>>> 
>>> def absolute(x):
    if x < 0:
        return (–x)
    return x
SyntaxError: invalid character '–' (U+2013)
>>> 
>>> def is_divisible(a, b):
    if a % b == 0:
        return True
    else:
        return False

>>> 
>>> is_divisible(10, 2)
True
>>> def student():
    name = "Hong, Gildong"  
    id = 20101234
    return name, id

>>> name,id =student()
>>> 
>>> print (name)
Hong, Gildong
>>> print(id)
20101234
>>> name = input("What is your name? ")
What is your name? 가나다
>>> print (name)
가나다
>>> raw_n = input("Enter a positive integer>
	      
SyntaxError: EOL while scanning string literal
>>> raw_n = input("Enter a positive integer> )
	      
SyntaxError: EOL while scanning string literal
>>> raw_n = input("Enter a positive integer> ")
Enter a positive integer> 123
>>> n = int(raw_n)
>>> for i in range(n):  #3
    print("*" * i)

    

*
**
***
****
*****
******
*******
********
*********
**********
***********
************
*************
**************
***************
****************
*****************
******************
*******************
********************
*********************
**********************
***********************
************************
*************************
**************************
***************************
****************************
*****************************
******************************
*******************************
********************************
*********************************
**********************************
***********************************
************************************
*************************************
**************************************
***************************************
****************************************
*****************************************
******************************************
*******************************************
********************************************
*********************************************
**********************************************
***********************************************
************************************************
*************************************************
**************************************************
***************************************************
****************************************************
*****************************************************
******************************************************
*******************************************************
********************************************************
*********************************************************
**********************************************************
***********************************************************
************************************************************
*************************************************************
**************************************************************
***************************************************************
****************************************************************
*****************************************************************
******************************************************************
*******************************************************************
********************************************************************
*********************************************************************
**********************************************************************
***********************************************************************
************************************************************************
*************************************************************************
**************************************************************************
***************************************************************************
****************************************************************************
*****************************************************************************
******************************************************************************
*******************************************************************************
********************************************************************************
*********************************************************************************
**********************************************************************************
***********************************************************************************
************************************************************************************
*************************************************************************************
**************************************************************************************
***************************************************************************************
****************************************************************************************
*****************************************************************************************
******************************************************************************************
*******************************************************************************************
********************************************************************************************
*********************************************************************************************
**********************************************************************************************
***********************************************************************************************
************************************************************************************************
*************************************************************************************************
**************************************************************************************************
***************************************************************************************************
****************************************************************************************************
*****************************************************************************************************
******************************************************************************************************
*******************************************************************************************************
********************************************************************************************************
*********************************************************************************************************
**********************************************************************************************************
***********************************************************************************************************
************************************************************************************************************
*************************************************************************************************************
**************************************************************************************************************
***************************************************************************************************************
****************************************************************************************************************
*****************************************************************************************************************
******************************************************************************************************************
*******************************************************************************************************************
********************************************************************************************************************
*********************************************************************************************************************
**********************************************************************************************************************
***********************************************************************************************************************
************************************************************************************************************************
*************************************************************************************************************************
**************************************************************************************************************************
>>> type(n)
<class 'int'>
>>> type(raw_n)
<class 'str'>
>>> 