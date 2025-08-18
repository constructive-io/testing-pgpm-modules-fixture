import { getConnections } from 'pgsql-test';

let db: any;
let pg: any;
let teardown: any;

beforeAll(async () => {
  ({ db, pg, teardown } = await getConnections());
});

afterAll(async () => {
  await teardown();
});

beforeEach(() => {
  pg.beforeEach();
});
afterEach(() => {
  pg.afterEach();
});

describe('inflection', () => {
  it('tableize', async () => {
    const { tableize } = await pg.one(
      `SELECT inflection.tableize($1::text) AS tableize`,
      ['BlogPost']
    );
    expect(tableize).toBe('blog_posts');
  });
});
