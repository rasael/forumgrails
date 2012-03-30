package enterprise



import org.junit.*
import grails.test.mixin.*

@TestFor(ArgumentController)
@Mock(Argument)
class ArgumentControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/argument/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.argumentInstanceList.size() == 0
        assert model.argumentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.argumentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.argumentInstance != null
        assert view == '/argument/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/argument/show/1'
        assert controller.flash.message != null
        assert Argument.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/argument/list'


        populateValidParams(params)
        def argument = new Argument(params)

        assert argument.save() != null

        params.id = argument.id

        def model = controller.show()

        assert model.argumentInstance == argument
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/argument/list'


        populateValidParams(params)
        def argument = new Argument(params)

        assert argument.save() != null

        params.id = argument.id

        def model = controller.edit()

        assert model.argumentInstance == argument
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/argument/list'

        response.reset()


        populateValidParams(params)
        def argument = new Argument(params)

        assert argument.save() != null

        // test invalid parameters in update
        params.id = argument.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/argument/edit"
        assert model.argumentInstance != null

        argument.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/argument/show/$argument.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        argument.clearErrors()

        populateValidParams(params)
        params.id = argument.id
        params.version = -1
        controller.update()

        assert view == "/argument/edit"
        assert model.argumentInstance != null
        assert model.argumentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/argument/list'

        response.reset()

        populateValidParams(params)
        def argument = new Argument(params)

        assert argument.save() != null
        assert Argument.count() == 1

        params.id = argument.id

        controller.delete()

        assert Argument.count() == 0
        assert Argument.get(argument.id) == null
        assert response.redirectedUrl == '/argument/list'
    }
}
