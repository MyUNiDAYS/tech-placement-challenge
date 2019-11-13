# UNiDAYS Discounts Coding Challenge App

This app is designed for the UNiDAYS Discounts Coding Challenge. It is powered by Flutter, with all the code being written in Dart. 

## Introduction

In order to complete this challenge, I experimented with implementing the [strategy pattern](https://en.wikipedia.org/wiki/Strategy_pattern). This can be explored in the [discount.dart](https://github.com/joeyvanlierop/tech-placement-challenge/blob/master/lib/shopping_system/discount.dart) file. Although I am unsure if I implemented the design pattern perfectly, everything functions quite well and the system should be very flexible for future expansion. More specific documentation is included in the files.

In order for the shopping system to communicate with the frontend, I utilized the [bloc pattern](https://pub.dev/packages/bloc). This can be explored in the [bloc](https://github.com/joeyvanlierop/tech-placement-challenge/tree/master/lib/shopping_system/bloc) folder. This turned out very well, and everything works perfectly.

## Building The App

In order to build and run the app, you can try following the instructions [here](https://flutter.dev/docs/deployment/android). Otherwise, try the following:
* Run `flutter build apk --release` to build an Android apk. (I have not tested the app on iOS, however it should work)
* Navigate to the generated apk in `build\app\outputs\apk\release` and install in on to your mobile device.

Or you can simply install the latest apk from the [releases](https://github.com/joeyvanlierop/tech-placement-challenge/releases).

---


# UNiDAYS Discounts Coding Challenge

## Introduction

This challenge is for you to make use of your problem solving skills as well as demonstrate your understanding of good object-oriented programming and SOLID design principles.

At UNiDAYS our business is built on providing discounts to students. Your challenge is to build a basic discount system that applies discounts to an online shopping order and calculates the total price based on a set of pricing rules.

You may complete the challenge in any programming language you wish.

## Pricing Rules

| Item | Price  | Discount |
| ---- | ------ | -------- |
| A    | £8.00  | None |
| B    | £12.00 | 2 for £20.00 |
| C    | £4.00  | 3 for £10.00 |
| D    | £7.00  | Buy 1 get 1 free |
| E    | £5.00  | 3 for the price of 2 |

## Delivery Charges

Delivery charge £7.00

Free delivery on orders over £50.00 (inclusive)

## Interface

Implement a `UnidaysDiscountChallenge` class with two public methods.

1. `AddToBasket` - Pass in an item
2. `CalculateTotalPrice` - Calculate and return the total price, result should include the following
    - `Total` - Total price of all items after applying any discounts
    - `DeliveryCharge` - The delivery charge for the order

It should be possible to initialise your `UnidaysDiscountChallenge` class with the pricing rules. The example below shows how the interface might be used.

```
example = new UnidaysDiscountChallenge(pricingRules);

example.AddToBasket(itemOne);
example.AddToBasket(itemTwo);

result = example.CalculateTotalPrice();

totalPrice = result.Total;
deliveryCharge = result.DeliveryCharge;
overallTotal = totalPrice + deliveryCharge;
```

## Example Test Cases

| Items          | Total  | Delivery Charge |
| -------------- | ------ | --------------- |
| _None_         | £0.00  | £0.00 |
| A              | £8.00  | £7.00 |
| B              | £12.00 | £7.00 |
| C              | £4.00  | £7.00 |
| D              | £7.00  | £7.00 |
| E              | £5.00  | £7.00 |
| BB             | £20.00 | £7.00 |
| BBB            | £32.00 | £7.00 |
| BBBB           | £40.00 | £7.00 |
| CCC            | £10.00 | £7.00 |
| CCCC           | £14.00 | £7.00 |
| DD             | £7.00  | £7.00 |
| DDD            | £14.00 | £7.00 |
| EE             | £10.00 | £7.00 |
| EEE            | £10.00 | £7.00 |
| EEEE           | £15.00 | £7.00 |
| DDDDDDDDDDDDDD | £49.00 | £7.00 |
| BBBBCCC        | £50.00 | £0.00 |
| ABBCCCDDEE     | £55.00 | £0.00 |
| EDCBAEDCBC     | £55.00 | £0.00 |

## Deliverables

You should provide a copy of your code in a publicly accessible location (e.g. Github, Bitbucket etc).

Your solution should include documentation describing how to build and run your code as well your approach to the problem. 

We're not too fussy about what platform your program runs on, but we do require that we're able to build and run your code ourselves.
