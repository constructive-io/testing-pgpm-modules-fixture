import { getConnections } from './utils';

let teardown: () => Promise<void>, conn: any;

describe('signup', () => {
  beforeAll(async () => {
    ({ db: conn, teardown } = await getConnections());
  });
  afterAll(async () => {
    await teardown();
  });
  describe('has a database', () => {
    it('query your database', async () => {
      const res = await conn.any('SELECT * FROM measurements.quantities LIMIT 1');
      expect(Array.isArray(res)).toBe(true);
    });
  });
});
