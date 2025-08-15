import { getConnections } from './utils/graphql';
import gql from 'graphql-tag';

let teardown: () => Promise<void>, graphQLQuery: any;

beforeAll(async () => {
  ({ teardown, graphQLQuery } = await getConnections(['measurements']));
});

afterAll(async () => {
  await teardown();
});

const SimpleQuery = gql`
  query {
    __typename
  }
`;

describe('signup', () => {
  describe('has an API', () => {
    it('query your API', async () => {
      const result = await graphQLQuery(SimpleQuery, {}, true);
      expect(result.errors).toBeFalsy();
    });
  });
});
