#
# Copyright 2011 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

module Katello
  module ModelUtils

    # hardcoded model names (uses kp_ prefix)
    @@table_to_model_hash = {
      "kt_environment" => KTEnvironment
    }

    # convert Rails Model name to Class or nil when no such table name exists
    def self.table_to_class name
      return @@table_to_model_hash[name] if @@table_to_model_hash.key? name
      name.classify.constantize
    rescue NameError => e
      # constantize throws NameError
      return nil
    end

    def self.labelize name
      name.gsub(".", "-").gsub(" ", "_").gsub(/[^a-z0-9\-_]/i,"")
    end
  end
end
