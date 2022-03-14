const cds = require('@sap/cds');


class CatalogServiceRest extends cds.ApplicationService {
    init() {

        xsenv.loadEnv();

        return super.init();
    }
}

module.exports = { CatalogServiceRest };
