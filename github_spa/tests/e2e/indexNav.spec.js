var IndexPage = require('./IndexPage');

describe('gaApp homepage', function() {

  var page = new IndexPage();

  beforeEach(function() {
    page.get();
    ptor = protractor.getInstance();
  });

  it('should navigate to the /students/id page when clicked', function() {
    (page.studentList).first().then(function(s){
      s.element(by.tagName('a')).click();
    })
    expect(ptor.getCurrentUrl()).toMatch(/(\#\/students\/)/)
  })


});


