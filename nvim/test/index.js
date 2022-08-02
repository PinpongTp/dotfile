let test = () => {
  const a = {};

  console.log('test');
  var testData = {
    data: 'test',
    text: 'text test for test text',
    number: 50,
  };

  a.a = 1;

  a.a += 20;

  a.a += 10;

  a.a = 0;

  console.log('a', a);

  console.log(test);
  console.log('test');
  console.log('testData log >> ', testData);
  // comment for test comment

  /**
   *
   * test comment tree
   * this is easy for comment but it not have color
   *
   */
};

test();
