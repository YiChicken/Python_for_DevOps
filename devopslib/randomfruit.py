from random import choices


def fruit():
    fruits = ["apple", "cherry", "strawberry"]
    return choices(fruits)[0]


def meal(beverage):
  my_fruit = fruit()
  print(f"Your fruit is {my_fruit} and beverage is {beverage}")
  if my_fruit =="cherry":
    complete_meal = f"Your meal is a {my_fruit} and {beverage}"
    return complete_meal

  return f"Your meal is a steak and {beverage}"
