`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:new-workout-template', 'Unit | Route | new workout template', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route