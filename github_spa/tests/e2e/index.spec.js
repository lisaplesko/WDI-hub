function IndexPage() {
  this.buttonNYC = element(by.id('NYC'));
  this.buttonBoston = element(by.id('Boston'));
  this.buttonAll = element(by.id('all'));

  this.get = function() {
    browser.get('http://localhost:5000');
  };

  this.getTitle = function() {
    return browser.getTitle();
  }
}

describe('angularjs homepage', function() {

  var page = new IndexPage();

  beforeEach(function() {
    page.get();
  });

  this.getTitle

  it('should display the correct title', function() {

    expect(page.getTitle()).toEqual('General Assembly GitPrint');
  });

  it('should filter the student list as user types into the search box', function(){

    var studentList = element.all(by.repeater('student in students'));
    var query = element(by.model('search.firstname'));

    expect(studentList.count()).toBe(53);

    query.sendKeys('Lisa');
    expect(studentList.count()).toBe(1);

    query.clear();
    query.sendKeys('Emma');
    expect(studentList.count()).toBe(2);

    query.clear();
    query.sendKeys('Lisa');
    expect(element(by.model('search.firstname')).getAttribute('value')).toEqual('Lisa');

    // expect(element(by.binding('student.firstname')).getText()).toEqual('Lisa');
  });

  it('should filter the student list when a city button is clicked', function(){
    var buttonNYC = element(by.id('NYC')),
        buttonBoston = element(by.id('Boston')),
        buttonAll = element(by.id('all')),
        studentList = element.all(by.repeater('student in students'));

    buttonNYC.click();
    expect(studentList.count()).toBe(5);

    buttonBoston.click();
    expect(studentList.count()).toBe(48);

    buttonAll.click();
    expect(studentList.count()).toBe(53);

  });

});

