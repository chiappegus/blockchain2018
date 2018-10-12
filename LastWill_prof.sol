pragma solidity ^0.4.24;

contract LastWill {
    address public  Owner ;
    address public  heredero;
    address public  reloj;
	constructor ()   {
		Owner = msg.sender;
		reloj = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
	}	

	function DonarDinero() public payable {
		require(msg.sender == Owner, "no es la persona");
	}

	function asignarHeredero(address _heredero) public{
			heredero = _heredero;
	}
	function estaMuerto() public{
		require(msg.sender==reloj,"no es una cuenta valida");
		heredero.transfer(address(this).balance);
	}
}

