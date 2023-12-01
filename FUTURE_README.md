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
- [Cache Misses](#cache_misses)
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

## :broken_heart: Cache Misses <a name = "cache_misses"></a>
In the set-associative cache, the memory address consists of three parts: the tag, index, and offset. These components help determine the location of the data within the cache. When there is a cache miss and the cache needs to fetch data from main memory, the cache address is used to construct the main memory address.

Here's a breakdown of the components in a memory address for a set-associative cache:

    Tag:
        The tag bits uniquely identify a particular block of data within a set. 
        The tag bits are used to check if the requested data is present in the cache.

    Index:
        The index bits determine which set within the cache the data belongs to. 
        It helps in selecting the set where the data should be stored or retrieved.

    Offset:
        The offset bits specify the position of the data within the cache block. 
        It indicates the location of the data within the selected cache line.

When there's a cache miss, the cache controller extracts the tag, index, and offset from the cache address. The index is used to identify the set in the cache, and the tag is compared with the tags in that set to check if the required data is present. If it's a miss, the cache controller constructs the main memory address using the tag, index, and offset bits.

The main memory address construction is done as follows:

    Combine Tag and Index:
        Concatenate the tag and index bits to form the main memory address. 
        This address is used to access the set in main memory where the required data is stored.

    Add Offset:
        Add the offset to the constructed main memory address to specify 
        the exact location within the block in main memory where the data is stored.

This main memory address is then used to initiate a request to the main memory subsystem to fetch the required data. Once the data is fetched, it is brought into the cache, and subsequent accesses to the same address can be served from the cache until the data is evicted or invalidated.

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
