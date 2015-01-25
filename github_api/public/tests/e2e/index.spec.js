var IndexPage = require('./IndexPage');

describe('gaApp homepage', function() {

  var page = new IndexPage();

  beforeEach(function() {
    page.get();
  });


  it('should display the correct title', function() {
    expect(page.getTitle()).toEqual('WDI Hub');
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
    expect(page.studentList.count()).toBe(90);

    page.query.sendKeys('Lisa');
    expect(page.studentList.count()).toBe(1);

    page.query.clear();
    page.query.sendKeys('Emma');
    expect(page.studentList.count()).toBe(2);

    page.query.clear();
    page.query.sendKeys('Lisa');
    expect((page.query).getAttribute('value')).toEqual('Lisa');
  });


  it('should filter the student list to match search box input', function(){
    page.query.sendKeys('Amanda');
    expect((page.query).getAttribute('value')).toEqual('Amanda');
  });


  it('should filter the student list when a cohort button is clicked', function(){
    page.clickButton('1');
    expect(page.studentList.count()).toBe(11);
    expect(page.sessionDates.getText()).toBe('September - December, 2013');

    page.clickButton('2');
    expect(page.studentList.count()).toBe(13);
    expect(page.sessionDates.getText()).toBe("January - April, 2014");

    page.clickButton('3');
    expect(page.studentList.count()).toBe(6);
    expect(page.sessionDates.getText()).toBe("April - July, 2014");

    page.clickButton('4');
    expect(page.studentList.count()).toBe(18);
    expect(page.sessionDates.getText()).toBe("July - September, 2014");

    page.clickButton('5');
    expect(page.studentList.count()).toBe(17);
    expect(page.sessionDates.getText()).toBe("September - December, 2014");

    page.clickButton('6');
    expect(page.studentList.count()).toBe(25);
    expect(page.sessionDates.getText()).toBe("January - April, 2015");

    page.clickButton('all');
    expect(page.studentList.count()).toBe(90);
    expect(page.sessionDates.getText()).toBe("");
  });

  it('should return nothing if no results match the search input', function(){
    page.query.sendKeys('Ya bahfed!');
    expect(page.studentList.count()).toBe(0);
  });
});

