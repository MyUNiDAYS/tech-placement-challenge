import sys

from utils import errors

class _Item:
    def __init__(self, name, pricingRules):
        self.name = name
        self.unitPrice = pricingRules['price']
        # number of items required to qualify for a discount
        self.discountFrequency = pricingRules['discountFrequency']
        # price of all items combined in a discount deal
        self.discountedPrice = pricingRules['discountedPrice']
        # the combined cost of all items of this type including discount
        self.totalItemPrice = 0
        # number of items that have yet to be included in discounts
        # stays at 0 if the item has no applicable discount rules
        self.discountCounter = 0
        # the price change associated with adding an item
        self.priceChange = 0

    # ==== PRIVATE METHODS ====
    def _ApplyDiscount(self):
        """
        Checks to see if a multi-buy discount can be applied and 
        adjusts the price according to the pricing rules.
        """
        # increment the discount counter for items with potential discounts
        if self.discountFrequency > 0:
            self.discountCounter += 1
        # check to see if the frequency has been reached where discount can be applied
        if self.discountCounter == self.discountFrequency:
            # reset the discount counter to 0
            self.discountCounter = 0
            # remove full prices and replace with the discounted value
            self.totalItemPrice -= (self.unitPrice * self.discountFrequency)
            self.totalItemPrice += self.discountedPrice
    
    def _IncrementFullPrice(self):
        """
        Adds the full-price of an item onto the current total price.
        """
        self.totalItemPrice += self.unitPrice
    
    def _CalculatePriceChange(self, previousPrice):
        """
        Updates the price change property with the latest price change 
        after adding a new unit and applying all discounts.
        """
        self.priceChange = self.totalItemPrice - previousPrice

    def _CalculatePrice(self):
        """
        Calls all necessary functions to update the price with all 
        applicable discounts.
        """
        # hold the previous price for the price change calculation
        previousPrice = self.totalItemPrice
        # increment the price with the full-price of the item
        self._IncrementFullPrice()
        # check for and apply discounts
        self._ApplyDiscount()
        # calculate the final price change after adding the unit
        self._CalculatePriceChange(previousPrice)
    
    # ==== PUBLIC METHODS ====
    def PriceChange(self):
        """
        Starts the price calculation and returns the price change
        associated with the added unit.
        """
        self._CalculatePrice()
        return self.priceChange

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
        