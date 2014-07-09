describe('filter', function() {
  beforeEach(angular.module('gaApp'));

  var repo_json = [{"name":"angular-demo-todo-app","stargazers_count":0,"watchers_count":0,"description":"","html_url":"https://github.com/lisaplesko/angular-demo-todo-app","updated":"2014-06-18T18:34:44.000Z","homepage":null,"languages":[{"lang_name":"CSS","lang_amount":412,"repo_id":20968287},{"lang_name":"JavaScript","lang_amount":479,"repo_id":20968287}],"key":1},{"name":"angular-chat-app","stargazers_count":1,"watchers_count":1,"description":"AngularJS, Firebase","html_url":"https://github.com/lisaplesko/angular-chat-app","updated":"2014-06-25T13:11:20.000Z","homepage":null,"languages":[{"lang_name":"CSS","lang_amount":2593,"repo_id":20976877},{"lang_name":"JavaScript","lang_amount":652,"repo_id":20976877}],"key":0}];

  var correct_result = [{"name":"angular-chat-app","stargazers_count":1,"watchers_count":1,"description":"AngularJS, Firebase","html_url":"https://github.com/lisaplesko/angular-chat-app","updated":"2014-06-25T13:11:20.000Z","homepage":null,"languages":[{"lang_name":"CSS","lang_amount":2593,"repo_id":20976877},{"lang_name":"JavaScript","lang_amount":652,"repo_id":20976877}],"key":0},{"name":"angular-demo-todo-app","stargazers_count":0,"watchers_count":0,"description":"","html_url":"https://github.com/lisaplesko/angular-demo-todo-app","updated":"2014-06-18T18:34:44.000Z","homepage":null,"languages":[{"lang_name":"CSS","lang_amount":412,"repo_id":20968287},{"lang_name":"JavaScript","lang_amount":479,"repo_id":20968287}],"key":1}];

  // describe('orderEventBy', function() {
  //   it('should order events by given date', inject(function ($filter) {
  //     expect(orderEventBy(repo_json, "stargazers_count", true).toEqual(correct_result))
  //   }))
  // })

  describe('reverse', function () {
    it('should reverse a string', inject(function (eventFilter) {
      expect(reverseFilter('ABCD')).toEqual('DCBA');
    }));
  })


})


