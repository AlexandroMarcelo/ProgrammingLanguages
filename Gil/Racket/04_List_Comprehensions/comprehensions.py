"""
Examples of list comprehensions in Python
"""

def squares(data):
    """ Using a loop and append to create a list """
    result = []
    for i in data:
        # Add only the squares of even numbers
        if i % 2 == 0:
            result.append(i * i)
    return result

def sqr(num):
    """ A simple function that can be called from 'map' """
    return num * num

def squares_map(data):
    """ Using 'map' to process the elements of a list """
    # Using a lambda function created at the moment
    return list(map(lambda x: x*x, data))
    # Using a function previously defined 
    #return map(sqr, data)

def squares_comprehension(data):
    """ Using list comprehensions """
    # Add only the squares of even numbers
    return [x * x for x in data if x % 2 == 0]
    # With two different paths
    return [x * x if x % 2 == 0 else x * x * x for x in data]

# Testing the functions
data = [3, 4, 5, 6, 7, 8, 9]
print(squares(data))
print(squares_map(data))
print(squares_comprehension(data))
