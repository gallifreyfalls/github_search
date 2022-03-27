# frozen_string_literal: true

class SearchService < ApplicationService
  DEFAULT_PER_PAGE = 10

  def initialize(query, page, per_page = nil)
    super
    @query = query
    @page = page.to_i.zero? ? 1 : page.to_i
    @per_page = per_page || DEFAULT_PER_PAGE
  end

  def call
    @results = obtain_results
    self
  rescue StandardError => e
    @errors = JSON.parse(e.response.body)
    self
  end

  private

  def obtain_results
    response = Tools::GithubApiTool.search(q: @query, page: @page, per_page: @per_page)
    results = JSON.parse(response.body)
    {
      total_pages: total_pages(results['total_count']),
      results: results['items'],
      page: @page,
      per_page: @per_page
    }
  end

  def total_pages(total_count)
    total_count / @per_page + ((total_count % @per_page).zero? ? 0 : 1)
  end
end
