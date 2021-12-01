# G5_Memory_Controller

The memory controller must exploit bank parallelism and an open page policy. Assume 
the DIMM is already initialized and all banks are in the pre-charged state. Do not model 
additive latency or CRC. The controller should maintain a queue of 16 outstanding 
memory requests

The shared last level cache of a four core 3.2 GHz processor employing a single memory 
channel. The system uses a relaxed consistency (XC) model. The memory channel is 
populated by a single-ranked 8GB PC4-25600 DIMM (constructed with memory chips 
organized as x8 devices with a 2KB page size and 24-24-24 timing). There is no ECC.


![Timing Constraints](https://user-images.githubusercontent.com/93422676/144278232-95b64eca-d6ab-42cb-9074-a653c0e01086.JPG)
