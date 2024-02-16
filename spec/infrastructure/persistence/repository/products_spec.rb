# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe Persistence::Repository::Products do
  subject(:repo) { described_class.new(ROM.env) }

  let(:repos) do
    {
      brands: Persistence::Repository::Brands.new(ROM.env),
      categories: Persistence::Repository::ProductCategories.new(ROM.env),
      joint: Persistence::Repository::ProductsProductCategories.new(ROM.env),
    }
  end

  describe 'filter_by_categories_and_brands' do
    context 'when no products' do
      it 'returns empty array' do
        result = repo.filter_by_categories_and_brands([1], [1])
        expect(result.count).to eq(0)
      end
    end

    context 'when products exist' do
      let!(:brands) {
        [
          repos[:brands].create({ name: 'H&M' }),
          repos[:brands].create({ name: 'Zara' }),
        ]
      }
      let!(:products) do
        [
          {
            id: 1,
            name: 'Robe',
            brand_id: brands[0].id,
          },
          {
            id: 2,
            name: 'Pull',
            brand_id: brands[1].id,
          },
        ].map { repo.create(_1) }
      end
      let!(:categories) do
        [
          {
            id: 1,
            code: 'color',
            name: 'Rose',
          },
          {
            id: 2,
            code: 'color',
            name: 'Noir',
          },
          {
            id: 3,
            code: 'occasion',
            name: 'Soirée',
          },
          {
            id: 4,
            code: 'size',
            name: 'XL',
          },
          {
            id: 5,
            code: 'size',
            name: 'L',
          },
          {
            id: 6,
            code: 'season',
            name: 'Ete',
          },
          {
            id: 7,
            code: 'season',
            name: 'Hiver',
          },
        ].map { repos[:categories].create(_1) }
      end
      let!(:joint) do
        [
          {
            product_id: 1,
            product_category_id: 1,
          },
          {
            product_id: 1,
            product_category_id: 3,
          },
          {
            product_id: 1,
            product_category_id: 5,
          },
          {
            product_id: 1,
            product_category_id: 7,
          },
          {
            product_id: 2,
            product_category_id: 2,
          },
          {
            product_id: 2,
            product_category_id: 3,
          },
          {
            product_id: 2,
            product_category_id: 5,
          },
          {
            product_id: 2,
            product_category_id: 6,
          },
        ].map { repos[:joint].create(_1) }
      end

      it 'returns corresponding products for brands and categories' do
        category_ids = [1]
        brand_ids = [1]
        expected_products_count = 1
        result = repo.filter_by_categories_and_brands(category_ids, brand_ids)
        expect(result.count).to eq(expected_products_count)
      end
    end
  end

  describe 'filter_by_categories' do
    context 'when no products' do
      it 'returns empty array' do
        result = repo.filter_by_categories([1])
        expect(result.count).to eq(0)
      end
    end

    context 'when products exist' do
      let!(:products) do
        [
          {
            id: 1,
            name: 'Robe',
          },
          {
            id: 2,
            name: 'Pull',
          },
        ].map { repo.create(_1) }
      end
      let!(:categories) do
        [
          {
            id: 1,
            code: 'color',
            name: 'Rose',
          },
          {
            id: 2,
            code: 'color',
            name: 'Noir',
          },
          {
            id: 3,
            code: 'occasion',
            name: 'Soirée',
          },
          {
            id: 4,
            code: 'size',
            name: 'XL',
          },
          {
            id: 5,
            code: 'size',
            name: 'L',
          },
          {
            id: 6,
            code: 'season',
            name: 'Ete',
          },
          {
            id: 7,
            code: 'season',
            name: 'Hiver',
          },
        ].map { repos[:categories].create(_1) }
      end
      let!(:joint) do
        [
          {
            product_id: 1,
            product_category_id: 1,
          },
          {
            product_id: 1,
            product_category_id: 3,
          },
          {
            product_id: 1,
            product_category_id: 5,
          },
          {
            product_id: 1,
            product_category_id: 7,
          },
          {
            product_id: 2,
            product_category_id: 2,
          },
          {
            product_id: 2,
            product_category_id: 3,
          },
          {
            product_id: 2,
            product_category_id: 5,
          },
          {
            product_id: 2,
            product_category_id: 6,
          },
        ].map { repos[:joint].create(_1) }
      end

      it 'returns corresponding products' do
        category_ids = [1, 6]
        expected_products_count = 2
        result = repo.filter_by_categories(category_ids)
        expect(result.count).to eq(expected_products_count)
      end
    end
  end

  describe 'filter_by_brands' do
    context 'when no products' do
      it 'returns empty array' do
        result = repo.filter_by_brands([1])
        expect(result.count).to eq(0)
      end
    end

    context 'when products exist' do
      let!(:brand1) { repos[:brands].create({ name: 'H&M' }) }
      let!(:brand2) { repos[:brands].create({ name: 'Zara' }) }
      let!(:products) do
        [
          {
            id: 1,
            name: 'Robe',
            brand_id: brand1.id,
          },
          {
            id: 2,
            name: 'Pull',
            brand_id: brand2.id,
          },
        ].map { repo.create(_1) }
      end

      it 'returns corresponding product for one brand' do
        result = repo.filter_by_brands([1])
        expect(result.count).to eq(products.select { _1[:brand_id] == 1 }.count)
      end
    end
  end
end
