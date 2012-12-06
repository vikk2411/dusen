# encoding: utf-8

class UserWithoutFulltext < ActiveRecord::Base

  self.table_name = 'users_without_fulltext'

  search_syntax do

    search_by :text do |scope, text|
      scope.where_like([:name, :email, :city] => text)
    end

    search_by :city do |scope, city|
      scope.scoped(:conditions => { :city => city })
    end

    search_by :email do |scope, email|
      scope.scoped(:conditions => { :email => email })
    end

  end

end

