// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Certificate {
    struct Student {
        string name;
        string ID;
        uint bacGrade;
        bool certified;
    }

    mapping (string => Student) students;

    function addStudent (string memory _name, string memory _ID, uint _bacGrade) public {
        students[_ID] = Student(_name, _ID, _bacGrade, false);
    }

    function certifyStudent (string memory _ID) public {
        require(students[_ID].bacGrade >= 10, "Student did not pass the baccalaureat");
        students[_ID].certified = true;
    }

    function getStudentCertificate (string memory _ID) public view returns (string memory, uint, bool) {
        return (students[_ID].name, students[_ID].bacGrade, students[_ID].certified);
    }
}
