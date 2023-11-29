<p align="center">
  <a href="" rel="noopener">
 <img width=709px height=407px src="Diagrams/set_associative_cache.jpg" alt="Project logo"></a>
</p>

<h3 align="center">Set Associative Cache</h3>

<div align="center">

  [![Status](https://img.shields.io/badge/status-active-success.svg)]() 
  [![GitHub Issues](https://img.shields.io/github/issues/kylelobo/The-Documentation-Compendium.svg)](https://github.com/sprsr/4xSA_Cache/issues)
  [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/kylelobo/The-Documentation-Compendium.svg)](https://github.com/sprsr/4xSA_Cache/pulls)
  [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> A modular and customizable set associative cache.
  Developed to be implemented into my 32 bit risc v core. This implementation of set associative will use a relative LRU algorithm.  Metadata is kept simple, with single bits: VALID, DIRTY, LRU (excluding tag).  Cache parameters can be manimpulated for custom caches. 
    <br> 
</p>

<p align="center">
  <a href="" rel="noopener">
 <img width=1404px height=1872px src="Diagrams/Cache Block Diagram.png" alt="Cache Structure"></a>
</p>

## 📝 Table of Contents
- [About](#about)
- [Getting Started](#getting_started)
- [Deployment](#deployment)
- [Usage](#usage)
- [Built Using](#built_using)
- [TODO](../TODO.md)
- [Contributing](../CONTRIBUTING.md)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## 🧐 About <a name = "about"></a>
This project was started to gain experience in digital design and brush up on chip architecture while becoming equipped with RISC V ISA.  RTL is described in Verilog 2012 and EDA tools consist of Icarus Verilog & Yosys. I also found the open source risc v assembler python package provided by _ very useful when testing in my Test Bench.  
The RV32 Processor is architected as a single core standard 5 stage pipeline.  Only Fetch and Decode stages will stall in two cases:  Failed Branch Prediction and sequential data conflict when the first instruction must write from data memory.  

## 🏁 Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites
What things you need to install the software and how to install them.

```
Give examples
```

### Installing
A step by step series of examples that tell you how to get a development env running.

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo.

## 🔧 Running the tests <a name = "tests"></a>
Explain how to run the automated tests for this system.

### Break down into end to end tests
Explain what these tests test and why

```
Give an example
```

### And coding style tests
Explain what these tests test and why

```
Give an example
```

## 🎈 Usage <a name="usage"></a>
Add notes about how to use the system.

## 🚀 Deployment <a name = "deployment"></a>
Add additional notes about how to deploy this on a live system.

## ⛏️ Built Using <a name = "built_using"></a>
- [MongoDB](https://www.mongodb.com/) - Database
- [Express](https://expressjs.com/) - Server Framework
- [VueJs](https://vuejs.org/) - Web Framework
- [NodeJs](https://nodejs.org/en/) - Server Environment

## ✍️ Authors <a name = "authors"></a>
- [@kylelobo](https://github.com/kylelobo) - Idea & Initial work

See also the list of [contributors](https://github.com/kylelobo/The-Documentation-Compendium/contributors) who participated in this project.

## 🎉 Acknowledgements <a name = "acknowledgement"></a>
- Hat tip to anyone whose code was used
- Inspiration
- References
