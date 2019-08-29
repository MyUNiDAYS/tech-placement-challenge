pricingRules = {
        'A': {'price': 8, 'discountFrequency': 0, 'discountedPrice': 0},
        'B': {'price': 12, 'discountFrequency': 2, 'discountedPrice': 20},
        'C': {'price': 4, 'discountFrequency': 3, 'discountedPrice': 10},
        'D': {'price': 7, 'discountFrequency': 2,'discountedPrice': 7},
        'E': {'price': 5, 'discountFrequency': 3,'discountedPrice': 10},
        }

deliveryRules = {
        'standard': 7,
        'freeThreshold': 50
        }

errors = {
    'invalidItem': 'An item was passed that has not been included in the pricing rules for this basket'
}