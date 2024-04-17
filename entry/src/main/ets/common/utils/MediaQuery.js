import mediaquery from '@ohos.mediaquery';
class MediaQuery {
    constructor() {
        this.smListener = mediaquery.matchMediaSync('(width < ' + 520 + 'vp)');
        this.mdListener = mediaquery.matchMediaSync('(width >= ' + 520 + 'vp) and (width <= ' + 840 + 'vp)');
        this.lgListener = mediaquery.matchMediaSync('(width > ' + 840 + 'vp)');
        this.darkmodeListener = mediaquery.matchMediaSync('screen and (dark-mode: true)');
        this.portraitFuncSm = null;
        this.portraitFuncMd = null;
        this.portraitFuncLg = null;
        this.portraitFuncDarkmode = null;
        this.screenType = '';
        var that = this;
        this.smListener = mediaquery.matchMediaSync('(width <= ' + 672 + ')');
        this.mdListener = mediaquery.matchMediaSync('(width > ' + 672 + ') and (width <= ' + 1250 + ')');
        this.lgListener = mediaquery.matchMediaSync('(width > ' + 1250 + ')');
        this.darkmodeListener = mediaquery.matchMediaSync('screen and (dark-mode: true)');
        this.portraitFuncSm = this.onPortraitSm.bind(this);
        this.smListener.on('change', this.portraitFuncSm);
        this.portraitFuncMd = this.onPortraitMd.bind(this);
        this.mdListener.on('change', this.portraitFuncMd);
        this.portraitFuncLg = this.onPortraitLg.bind(this);
        this.lgListener.on('change', this.portraitFuncLg);
    }
    onPortraitSm(mediaQueryResult) {
        if (mediaQueryResult.matches) {
            this.screenType = 'sm';
            console.info('sm');
        }
    }
    onPortraitMd(mediaQueryResult) {
        if (mediaQueryResult.matches) {
            this.screenType = 'md';
            console.info('md');
        }
    }
    onPortraitLg(mediaQueryResult) {
        if (mediaQueryResult.matches) {
            this.screenType = 'lg';
            console.info('lg');
        }
    }
}
export default new MediaQuery();
//# sourceMappingURL=MediaQuery.js.map