


const ItemManager = artifacts.require("./ItemManager.sol");

contract("ItemManager", accounts => {
    it("...should be able to add an Item", async function() {
        const itemManagerInstance = await ItemManager.deployed();
        const itemName ="test1";
        const itemPrice = 500 ;

        const result = await itemManagerInstance.createItem(itemName, itemPrice, {from: accounts[0]});
        assert.equal(result.logs[0].args._itemIndex, 0, "Đó không phải là mục đầu tiên");

        const item = await itemManagerInstance.items(0);
        assert.equal(item._identifier, itemName, "Mã định danh là khác nhau");

    })
});