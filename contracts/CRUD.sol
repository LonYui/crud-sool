pragma solidity 0.8.7;

contract CRUD {
    struct User {
        string account;
        string password;
        uint status;
        uint createdAt;
        uint updatedAt;
    }

    mapping (string => User) public users;
    string[] public accounts;

    function initialize() external {
    }

    function createUser(string memory _account, string memory _password) public {
        //        確認還沒創造
        require(indexOf(accounts,_account) == 2^256 -1,"already exist");
        users[_account] = User(_account, _password, 1, block.timestamp, block.timestamp);
        accounts.push(_account);
    }

    function updateUser(string memory _account, string memory _password) public {
        //        確認存在
        require(indexOf(accounts,_account) != 2^256 -1,"not exit");
        users[_account].password = _password;
        //        users[_account].status = _status;
        users[_account].updatedAt = block.timestamp;
    }

    function deleteUser(string memory _account) public {
        //        確認存在
        require(indexOf(accounts,_account) != 2^256 -1,"not exit");

        //        delete users[_account];
        users[_account].status =  0;
        //        delete accounts[indexOf(accounts,_account)];
    }

    //    function getUsers() public returns (User[] memory){
    //        User[] storage result ;
    //        for (uint256 i = 0; i < accounts.length; i++) {
    //            //bytes(_name).length > 0
    //            if (bytes(accounts[i]).length > 0){
    //                result.push(users[accounts[i]]);
    //            }
    //        }
    //        return result;
    //    }

    function getAccountLength() public view returns (uint256){
        return accounts.length;
    }

    function indexOf(string[] memory arr, string memory searchFor) private pure returns (uint256) {
        for (uint256 i = 0; i < arr.length; i++) {
            //            if (arr[i] == searchFor) {
            if (equal(arr[i],searchFor)) {
                return i;
            }
        }
        return 2^256 -1; // not found
    }

    function equal(string memory a, string memory b) private pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

}