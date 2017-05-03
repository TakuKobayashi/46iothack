import { YoroiothackPage } from './app.po';

describe('yoroiothack App', function() {
  let page: YoroiothackPage;

  beforeEach(() => {
    page = new YoroiothackPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
