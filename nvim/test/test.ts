//
// FIX:test
// TODO:test
// WARN:test
// PERF:test
// NOTE:test
// PINK:test
// HACK:test
//
export class test {
  testFunction = () => {
    return null
  }
}


export default function foo(a: number): number {
  console.log("test log"); 
  console.log(`test ${test}`)

  let error = {};
  test test = {};
  test zz = ''

  const _test = new test
  const va = _test.testFunction()
  console.log(va)
  console.log(zz)

  const testtext = "test";
  console.log(test);
  console.log(testtext);
  if (true) {
    console.log(66)
  }
}

console.log();

console.log();
console.log();

foo(1);
foo(2);
