# Copyright (C) 2009-2014 MongoDB, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Mongo

  module Operation

    # A MongoDB kill cursors operation.
    #
    # @since 2.0.0
    class KillCursors
      include Executable

      # The ids of the cursors to kill.
      #
      # @return [Array] Ids of the cursors to kill.
      #
      # @since 2.0.0
      attr_reader :cursor_ids

      # Initialize the kill cursors operation.
      #
      # @example
      #   Mongo::Operation::KillCursor.new({ :cursor_ids => [1, 2] })
      #
      # @param [ Hash ] spec The specifications for the operation.
      #
      # @option spec :cursor_ids [ Array ] The ids of cursors to kill.
      #
      # @since 2.0.0
      def initialize(spec)
        @spec = spec
      end

      private

      # The ids of the cursors to kill.
      #
      # @return [ Array ] The cursor ids.
      #
      # @since 2.0.0
      def cursor_ids
        @spec[:cursor_ids]
      end

      # The wire protocol message for this kill cursors operation.
      #
      # @return [ Mongo::Protocol::KillCursors ] Wire protocol message.
      #
      # @since 2.0.0
      def message
        Protocol::KillCursors.new(cursor_ids)
      end
    end
  end
end
