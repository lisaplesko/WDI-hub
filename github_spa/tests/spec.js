// spec.js
describe('angularjs homepage', function() {
  beforeEach(function() {
    browser.get('http://localhost:5000/');
  });

  it('should have a title', function() {

    expect(browser.getTitle()).toEqual('General Assembly GitPrint');
  });

  it('should filter Lisa Plesko', function() {
    element(by.model('search')).sendKeys('Lisa Plesko');
    browser.waitForAngular();

    expect(element(by.binding('student.firstname')).getText()).
      toEqual('Lisa');
    expect(element(by.binding('student.lastname')).getText()).
      toEqual('Plesko');
  })
});

