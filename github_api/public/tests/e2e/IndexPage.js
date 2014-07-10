function IndexPage() {

  this.studentList = element.all(by.repeater('student in students'));
  this.query = element(by.model('search.firstname'));
  this.firstName = element(by.binding('firstname'));

  this.get = function() {
    browser.get('http://localhost:3000/#/students');
  };

  this.getTitle = function() {
    return browser.getTitle();
  }

  this.clickButton = function(id) {
    var button = element(by.id(id));
    button.click();
  }

}

// Can module export because Protractor runs on Node
module.exports = IndexPage;
