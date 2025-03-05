import {Test} from "forge-std/Test.sol";
import {Brams} from "../src/vendorToken.sol";
import {console} from "forge-std/console.sol";

contract TestVendor is Test {
    Brams brams;

    function setUp() public {
        brams = new Brams("Brams", "BRM", 1000);
    }

    function testDeposit() public {
        console.log(brams.getBalanceAddress(address(this)));
    }
}
