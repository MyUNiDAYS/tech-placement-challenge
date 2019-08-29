import sys

from utils import errors

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

    # ==== PRIVATE METHODS ====
    def _HandleError(self, exitCode, errorMessage):
        """
        Takes an exitCode and an error string and handles the error.
        """
        print(errors[errorMessage])
        sys.exit(exitCode)

    def _CheckItemValidity(self, item):
        """
        Checks to see whether a legitimate item is passed with required
        pricing rules, calls the error handler if otherwise.
        """
        if item not in self.pricingRules:
            self._HandleError(0, 'invalidItem')
    
    def _ItemInBasketCheck(self,item):
        """
        Checks to see whether this item-type already exists in the basket,
        return True in positive cases.
        """
        if item not in self.basket:
            return True
    
    def _UpdateTotalPrice (self,priceChange):
        """
        Updates the total price including any discounts.
        """
        self.price['Total'] += priceChange

    def _UpdateDeliveryCharge(self):
        """
        Updates the delivery charge according to the delivery rules.
        """
        if self.price['Total'] >= self.freeDeliveryThreshold:
            self.price['DeliveryCharge'] = 0
        else:
            self.price['DeliveryCharge'] = self.standardDeliveryCharge

    def _UpdatePrice(self, priceChange):
        """
        Calls all necessary price change functions.
        """
        self._UpdateTotalPrice(priceChange)
        self._UpdateDeliveryCharge()
    
    # ==== PUBLIC METHODS ====
    def AddToBasket(self, item):
        """
        Adds the item to the basket and calls the _UpdatePrice function.
        """
        # check to make sure pricing rules have been provided for the item
        self._CheckItemValidity(item)
        # check if this item type has already been added to basket
        if self._ItemInBasketCheck(item):
            # create a fresh instance of _Item and add it to basket
            itemToAdd = _Item(item, self.pricingRules[item])
            self.basket[item] = itemToAdd
        # get the price change for adding a unit of the item
        priceChange = self.basket[item].PriceChange()
        # update the price
        self._UpdatePrice(priceChange)
    
    def CalculateTotalPrice(self):
        """
        Returns the current price of the basket and the current delivery 
        charge with all discounts are applied.
        """
        return self.price