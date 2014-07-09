var IndexPage = require('./IndexPage');

describe('gaApp homepage', function() {

  var page = new IndexPage();

  beforeEach(function() {
    page.get();
  });

  this.getTitle

  it('should display the correct title', function() {

    expect(page.getTitle()).toEqual('General Assembly GitPrint');
  });

  it('includes a user gravatar per-element', function() {
  (page.studentList).first().then(function(s){
    s.element(by.tagName('img')).then(function(img) {
      img.getAttribute('src').then(function(src) {
        expect(src).toMatch(/(^https:\/\/avatars\.githubusercontent\.com\/u)/);
        });
      });
    });
  });


  it('should filter the student list as user types into the search box', function(){

    expect(page.studentList.count()).toBe(53);

    page.query.sendKeys('Lisa');
    expect(page.studentList.count()).toBe(1);

    page.query.clear();
    page.query.sendKeys('Emma');
    expect(page.studentList.count()).toBe(2);

    page.query.clear();
    page.query.sendKeys('Lisa');
    expect((page.query).getAttribute('value')).toEqual('Lisa');

    // expect(element(by.binding('student.firstname')).getText()).toEqual('Lisa');
  });


  it('should filter the student list when a city button is clicked', function(){

    page.clickButton('NYC');
    expect(page.studentList.count()).toBe(5);

    page.clickButton('Boston');
    expect(page.studentList.count()).toBe(48);

    page.clickButton('all');
    expect(page.studentList.count()).toBe(53);

  });

});

