import {gql} from "apollo-boost";

export const GET_PRODUCTS = gql`
  query {
    products {
      name
      price
      brand {
        name
      }
    }
  }
`;

export const GET_BRANDS = gql`
  query {
    brands {
      name
    }
  }
`;

export const CREATE_PRODUCT = gql`
  mutation createProduct($name: String!, $price: Int!, $brandId: Int!) {
    createProduct(name: $name, price: $price, brandId: $brandId) {
      name
    }
  }
`;