import unittest

from unidays_discount_challenge import UnidaysDiscountChallenge


# This project runs on Python 3.7 (earlier versions of Python should work as well but it has not been tested).
class TestUniDaysDiscountChallenge(unittest.TestCase):
    challenge = UnidaysDiscountChallenge()

    def setUp(self):
        # Arrange.
        self.challenge = UnidaysDiscountChallenge()

    def test_scenario_1(self):
        # Act.
        self.challenge.add_to_basket()
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(0, total)
        self.assertEqual(0, delivery_charge)

    def test_scenario_2(self):
        # Act.
        self.challenge.add_to_basket("A")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(8, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_3(self):
        # Act.
        self.challenge.add_to_basket("B")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(12, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_4(self):
        # Act.
        self.challenge.add_to_basket("C")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(4, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_5(self):
        # Act.
        self.challenge.add_to_basket("D")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(7, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_6(self):
        # Act.
        self.challenge.add_to_basket("E")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(5, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_7(self):
        # Act.
        self.challenge.add_to_basket("BB")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(20, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_8(self):
        # Act.
        self.challenge.add_to_basket("BBB")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(32, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_9(self):
        # Act.
        self.challenge.add_to_basket("BBBB")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(40, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_10(self):
        # Act.
        self.challenge.add_to_basket("CCC")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(10, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_11(self):
        # Act.
        self.challenge.add_to_basket("CCCC")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(14, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_12(self):
        # Act.
        self.challenge.add_to_basket("DD")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(7, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_13(self):
        # Act.
        self.challenge.add_to_basket("DDD")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(14, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_14(self):
        # Act.
        self.challenge.add_to_basket("EE")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(10, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_15(self):
        # Act.
        self.challenge.add_to_basket("EEE")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(10, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_16(self):
        # Act.
        self.challenge.add_to_basket("EEEE")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(15, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_17(self):
        # Act.
        self.challenge.add_to_basket("DDDDDDDDDDDDDD")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(49, total)
        self.assertEqual(7, delivery_charge)

    def test_scenario_18(self):
        # Act.
        self.challenge.add_to_basket("BBBBCCC")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(50, total)
        self.assertEqual(0, delivery_charge)

    def test_scenario_19(self):
        # Act.
        self.challenge.add_to_basket("ABBCCCDDEE")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(55, total)
        self.assertEqual(0, delivery_charge)

    def test_scenario_20(self):
        # Act.
        self.challenge.add_to_basket("EDCBAEDCBC")
        self.challenge.calculate_total_cost()

        total = self.challenge.total
        delivery_charge = self.challenge.delivery_charge

        # Assert.
        self.assertEqual(55, total)
        self.assertEqual(0, delivery_charge)


if __name__ == '__main__':
    unittest.main()
