const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Sample Contract", () => {
    let SampleContract, sampleContract;

    beforeEach(async () => {
        SampleContract = await ethers.getContractFactory("SampleContract");
        sampleContract = await SampleContract.deploy();
    });

    it("emit greeting event when greet function is called", async () => {
        expect(sampleContract.greet())
            .to
            .emit(sampleContract, "Greet")
            .withArgs("Hello World!");
    });

});

describe("Employer contract", () => {
    let Employer, employer;
    let sampleAddr = "0x91c6B8b3B118d42A9a558FF5FdC29447E02f51Ae"

    beforeEach(async () => {
        Employer = await ethers.getContractFactory("Employer");
        employer = await Employer.deploy("YO", "0xB4D7aCD5B198c5142CAf2683B805b3a099d5f2Cb");
    });

    it("it adds employee", async () => {
        employer.addEmployee("0xB4D7aCD5B198c5142CAf2683B805b3a099d5f2Cb", 2000);
        console.log((await employer.getEmployees()).includes("0xB4D7aCD5B198c5142CAf2683B805b3a099d5f2Cb"))
        console.log(await employer.getEmployees())

    });

    describe("update", () => {
        it ("it updates salary", async () => {
            employer.addEmployee(sampleAddr, 2000)
            console.log(await employer.getSalary(sampleAddr))
            employer.updateSalary(sampleAddr, 3000)
            console.log(await employer.getSalary(sampleAddr))
        })
        it("reverts if caller is not owner", async () => {
            let kai = await employer.connect("0x91c6B8b3B118d42A9a558FF5FdC29447E02f51Ae")
//             console.log(kai)
            kai.updateSalary(sampleAddr, 10)
            console.log(await employer.getEmployees())
            console.log(await kai.getSalary(sampleAddr))
        })
    })
});
