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

it('totp.generate + totp.verify basic', async () => {
  const { generate } = await pg.one(
    `SELECT totp.generate($1::text) AS generate`,
    ['secret']
  );
  const { verify } = await pg.one(
    `SELECT totp.verify($1::text, $2::text) AS verify`,
    ['secret', generate]
  );
  expect(typeof generate).toBe('string');
  expect(verify).toBe(true);
});
