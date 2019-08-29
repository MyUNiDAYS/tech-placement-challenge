from unidays import UnidaysDiscountChallenge
from utils import pricingRules, deliveryRules

# change the basket here to test different configurations
itemsToAdd = ['A','B','C','D','E']

basketCost = UnidaysDiscountChallenge(pricingRules,deliveryRules)
for item in itemsToAdd:
    basketCost.AddToBasket(item)
res = basketCost.CalculateTotalPrice()
print(res)
