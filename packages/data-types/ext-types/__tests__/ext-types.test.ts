import { getConnections, PgTestClient } from 'pgsql-test';

let db: PgTestClient;
let pg: PgTestClient;
let teardown: () => Promise<void>;

beforeAll(async () => {
  ({ db, pg, teardown } = await getConnections());
});

afterAll(async () => {
  try {
    await teardown();
  } catch {}
});

beforeEach(() => pg.beforeEach());
afterEach(() => pg.afterEach());

describe('@launchql/ext-types', () => {
  it('has extension installed', async () => {
    const { extname } = await pg.one(
      `SELECT extname FROM pg_extension WHERE extname = 'ext_types'`
    );
    expect(extname).toBe('ext_types');
  });
});
