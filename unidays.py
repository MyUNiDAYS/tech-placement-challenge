class UnidaysDiscountChallenge:
    def __init__(self, pricingRules, deliveryRules):
        self.pricingRules = pricingRules
        self.standardDeliveryCharge = deliveryRules['standard']
        self.freeDeliveryThreshold = deliveryRules['freeThreshold']
        self.price = {
            'Total': 0,
            'DeliveryCharge': 0
        }
        self.basket = {}