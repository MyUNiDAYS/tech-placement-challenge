import json

DEFAULT_DELIVERY_CHARGE = 7
FREE_DELIVERY_IF_TOTAL_EXCEEDS = 50


# This project runs on Python 3.7 (earlier versions of Python should work as well but it has not been tested).
class UnidaysDiscountChallenge:

    basket = []
    original_price, discount, total, delivery_charge = 0, 0, 0, DEFAULT_DELIVERY_CHARGE

    # pricing_rules_location refers to the location of the JSON file.
    def __init__(self, pricing_rules_location=None):
        self.basket = []

        if pricing_rules_location is None:
            pricing_rules_location = 'pricing_rules.json'

        try:
            with open(pricing_rules_location) as json_file:
                self.pricing_rules = json.load(json_file)

        except FileNotFoundError:
            print(pricing_rules_location + ' cannot be found.')
            exit()

    # Arguments can be in the form of a list or a bunch of letters like "AADD".
    def add_to_basket(self, *argv):
        if len(argv) == 0:
            return

        # This allows input like "BBBBCCC" to be accepted.
        if len(argv[0]) > 1:
            argv = list(argv[0])

        # Check that item exist and if it does, add the item into the basket.
        for arg in argv:
            if self.is_item_name_valid(str(arg).upper()):
                self.basket.append(arg)
                # print(arg + ' has been added to the basket successfully.')

            else:
                print(arg + ' cannot be found in pricing rules.')

    def calculate_total_cost(self):
        self.reset_to_default_values()

        if len(self.basket) == 0:
            print('The basket is empty.')
            self.delivery_charge = 0
            return

        processed_items = []

        for item in self.basket:
            if item in processed_items:
                continue

            count = self.basket.count(item)
            result = self.calculate_cost(item, count)

            self.total += result[0]
            self.original_price += result[1]
            self.discount += result[2]

            processed_items.append(item)

        self.calculate_delivery_charge()

    def calculate_delivery_charge(self):
        if self.total >= FREE_DELIVERY_IF_TOTAL_EXCEEDS:
            self.delivery_charge = 0
        else:
            self.delivery_charge = DEFAULT_DELIVERY_CHARGE

    # Calculates the actual price, original price and discount for all the items of the same type.
    def calculate_cost(self, name, count):
        actual_cost = 0
        original_price = 0

        price = None
        discount_code = None
        condition = None

        for item in self.pricing_rules:
            if name == item.get('name'):
                # Get relevant information from JSON file.
                price = item.get('price')
                discount_code = item.get('discount')
                condition = item.get('condition')

                original_price = count * price
                break

        if discount_code is None:
            actual_cost = original_price

        else:
            # Get conditions.
            x = condition[0]
            y = condition[1]

            # Example: 2 for £20.00
            if discount_code == 'BUY_X_FOR_Y_COST':
                actual_cost = (count // x * y) + (count % x * price)

            # Example: Buy 1 get 1 free
            elif discount_code == 'BUY_X_GET_Y_FREE':
                group = x + y
                actual_cost = (count // group * x * price) + (count % group * price)
                pass

            # Example: 3 for the price of 2
            elif discount_code == 'BUY_X_FOR_PRICE_OF_Y':
                y_cost = y * price
                actual_cost = (count // x * y_cost) + (count % x * price)

        discount = original_price - actual_cost

        return [actual_cost, original_price, discount]

    # Returns true if item exist in pricing rules JSON.
    def is_item_name_valid(self, name):
        for item in self.pricing_rules:
            if name == item.get('name'):
                return True

        return False

    def has_discount(self, name):
        for item in self.pricing_rules:
            if name == item.get('name') and item.get('discount') is not None:
                return True

        return False

    def reset_to_default_values(self):
        self.original_price = 0
        self.discount = 0
        self.total = 0
        self.delivery_charge = DEFAULT_DELIVERY_CHARGE

    def print_receipt(self):
        print('The items in the basket are ' + str(self.basket))
        print('The total cost is £' + str(self.total))
        print('The delivery charge is £' + str(self.delivery_charge))
        print('The original price is £' + str(self.original_price))
        print('The total discount is £' + str(self.discount) + '\n')
