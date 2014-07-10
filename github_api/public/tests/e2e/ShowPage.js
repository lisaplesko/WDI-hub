function ShowPage() {

  this.firstName = element(by.tagName('h1'));

  this.get = function() {
    browser.get('http://localhost:5000/#/students/27');
  };

}

// Can module export because Protractor runs on Node
module.exports = ShowPage;
