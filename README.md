# Hash

Hash is a Haxe non-cryptographic hash library. It provides different hash algorithms

# Installation
```bash
$ haxelib install hash
```

To use it, add `-lib hash` to the `build.hxml` file in your project folder.


### Supported hash algorithms

  * [`Murmur Hash`](#murmur-hash)
    * Murmur1 (32-bit)
    * Murmur2 (32-bit/64-bit)
    * Murmur3 (32-bit/128-bit(x86)/128-bit(x64) and incremental implementation 32-bit)

### Usage

#### Murmur Hash
The current implementation contains all available Murmur hash functions : Murmur1 (32-bit) , Murmur2 (32-bit and 64-bit) , Murmur3 ( 32-bit , 128-bit ( for x86)  and 128-bit ( for x64) . Murmur3 also includes an incremental implementation of the MurmurHash3 algorithm (32-bit).
All 32-bit versions returns unsigned int . The other ( 64-bit and 128-bit) versions return hexadecimal string as the result. The default seed value for all methods is 0, and could be set different one in the hash method.

Example:

```haxe
  var msg = Bytes.ofString("Haxe - The Cross-platform Toolkit");
  var seed:Int32 = 0;
  
  var hash:UInt = Murmur1.hash(msg);  // or  Murmur1.hash(msg,seed)
  trace("Murmur1 hash: "+hash);  	  // 32-bit hash
  // Murmur1 hash: 1632182447
  
  var hash:UInt = Murmur2.hash(msg,1);
  trace("Murmur2 hash: "+hash); 	// 32-bit 
  // Murmur2 hash: 2071049657
  
  var hash:String = Murmur2.hash64(msg);
  trace("Murmur2 hash64: "+hash); 	// 64-bit 
  // Murmur2 hash64: 12FED20572F06B95
  
  var hash:UInt = Murmur3.hash(msg);
  trace("Murmur3 hash: "+hash); 	// 32-bit 
  // Murmur3 hash: 3057977706
  
  var hash:String = Murmur3.hash128(msg);
  trace("Murmur3 hash128(x64): "+hash); 	// 128-bit ( x64 default ) 
  // Murmur3 hash128(x64): 140340D963D731CEEB16C0E96CB7F049
    
  var hash:String = Murmur3.hash128_x86(msg);
  trace("Murmur3 hash128(x86): "+hash); 	// 128-bit ( x86 ) 
  // Murmur3 hash128(x86): 49A00D924D1A7F82ED425272289BE8CF
  
  //incremental version
  var murmur3:Murmur3 = new Murmur3();
  murmur3.addString('Haxe').add(Bytes.ofString(' - ')).addString('The Cross-platform Toolkit'); //add string and bytes
  var hash:UInt = murmur3.result(); // get the hash result
  trace("Murmur3 hash32 (incremental): "+hash);  // 3057977706
  
  murmur3.reset(1).add(msg);  //clear all data and set seed to 1. Add msg
  hash =  murmur3.result();
  trace("Murmur3 hash32 (incremental with seed 1): "+hash); // 1030413113
  
```